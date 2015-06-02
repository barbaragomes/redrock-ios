//
//  VisualizationHandler.swift
//  Spark Insights
//
//  Holds functions related to particular visualizations
//
//  Created by Rosstin Murphy on 5/29/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

import Foundation
import UIKit

class VisualizationHandler{
    
    var visualizationNames: [String] = [String]()
    var webViews : [UIWebView] = [UIWebView]()
    
    func getNumberOfVisualizations()->Int{
        return visualizationNames.count;
    }
    
    func reloadAppropriateView(viewNumber: Int){
        println("should reload \(viewNumber)")
        
        switch visualizationNames[viewNumber]{
        case "treemap":
            webViews[viewNumber].scalesPageToFit = false
        case "circlepacking":
            webViews[viewNumber].scalesPageToFit = false
        case "worddistance":
            webViews[viewNumber].scalesPageToFit = false
        case "timemap":
            webViews[viewNumber].scalesPageToFit = true
        case "stackedbar":
            webViews[viewNumber].scalesPageToFit = false
        default:
            webViews[viewNumber].scalesPageToFit = false
        }
        
        webViews[viewNumber].loadRequest(webViews[viewNumber].request!)
    }
    func transformData(webView: UIWebView){
        // should tell it which webView I am with some property
        // can do better than this
        switch webView.request!.URL!.lastPathComponent!{
        case "treemap.html":
            transformDataForTreemapping(webView)
        case "circlepacking.html":
            transformDataForCirclepacking(webView)
        case "worddistance.html":
            transformDataForWorddistance(webView)
        case "timemap.html":
            transformDataForTimemap(webView)
        case "stackedbar.html":
            transformDataForStackedbar(webView)
        default:
            break
        }
        
    }
    
    func transformDataForTreemapping(webView: UIWebView){
        println("transformDataForTreemapping: "+webView.request!.URL!.lastPathComponent!)
        
        var treeScript = "var data7 = '{\"name\": \"all\",\"children\": [{\"name\": \"zebra\",\"children\": [{\"name\": \"zebra\", \"size\": 3938}]},{\"name\": \"cop\",\"children\": [{\"name\": \"cop\", \"size\": 743}]}]}'; renderChart(data7);"
        
        webView.stringByEvaluatingJavaScriptFromString(treeScript)
    }
    
    func transformDataForCirclepacking(webView: UIWebView){
        println("transformDataForCirclepacking: "+webView.request!.URL!.lastPathComponent!)

        var script = "var data7 = '{\"name\": \"all\",\"children\": [{\"name\": \"accountant\",\"children\": [{\"name\": \"accountant\", \"size\": 3938}]},{\"name\": \"cop\",\"children\": [{\"name\": \"cop\", \"size\": 743}]}]}'; renderChart(data7);"
        
        webView.stringByEvaluatingJavaScriptFromString(script)
    }
    
    func transformDataForWorddistance(webView: UIWebView){
        println("transformDataForWorddistance: "+webView.request!.URL!.lastPathComponent!)
        
        //var script2 = "renderChart(\"blah\");"
        
        var wordScript = "var myData = '{\"name\": \"cat\",\"children\": [{\"name\": \"feline\", \"distance\": 0.6, \"size\": 44},{\"name\": \"dog\", \"distance\": 0.4, \"size\": 22},{\"name\": \"bunny\", \"distance\": 0.0, \"size\": 10},{\"name\": \"gif\", \"distance\": 1.0, \"size\": 55},{\"name\": \"tail\", \"distance\": 0.2, \"size\": 88},{\"name\": \"fur\", \"distance\": 0.7, \"size\": 50}]}'; var w = \(webView.window!.frame.size.width); var h = \(webView.window!.frame.size.height); renderChart(myData,w,h);"
        
        webView.stringByEvaluatingJavaScriptFromString(wordScript)
    }

    func transformDataForTimemap(webView: UIWebView){
        
        println("transformDataForTimemap: "+webView.request!.URL!.lastPathComponent!)
        
        var timemapScript = "var myData = '{\"name\": \"cat\",\"children\": [{\"name\": \"feline\", \"distance\": 0.6, \"size\": 44},{\"name\": \"dog\", \"distance\": 0.4, \"size\": 22},{\"name\": \"bunny\", \"distance\": 0.0, \"size\": 10},{\"name\": \"gif\", \"distance\": 1.0, \"size\": 55},{\"name\": \"tail\", \"distance\": 0.2, \"size\": 88},{\"name\": \"fur\", \"distance\": 0.7, \"size\": 50}]}'; var w = \(webView.window!.frame.size.width); var h = \(webView.window!.frame.size.height); renderChart(myData);"
        
        webView.stringByEvaluatingJavaScriptFromString(timemapScript)
    }
    
    func transformDataForStackedbar(webView: UIWebView){
        
        println("transformDataForStackedbar: "+webView.request!.URL!.lastPathComponent!)
        
        var timemapScript = "var myData = '{\"name\": \"cat\",\"children\": [{\"name\": \"feline\", \"distance\": 0.6, \"size\": 44},{\"name\": \"dog\", \"distance\": 0.4, \"size\": 22},{\"name\": \"bunny\", \"distance\": 0.0, \"size\": 10},{\"name\": \"gif\", \"distance\": 1.0, \"size\": 55},{\"name\": \"tail\", \"distance\": 0.2, \"size\": 88},{\"name\": \"fur\", \"distance\": 0.7, \"size\": 50}]}'; var w = \(webView.window!.frame.size.width); var h = \(webView.window!.frame.size.height); renderChart(myData);"
        
        webView.stringByEvaluatingJavaScriptFromString(timemapScript)
    }

    
    
}