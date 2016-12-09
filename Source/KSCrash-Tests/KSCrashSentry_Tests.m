//
//  KSCrashSentry_Tests.m
//
//  Created by Karl Stenerud on 2013-03-09.
//
//  Copyright (c) 2012 Karl Stenerud. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall remain in place
// in this source code.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//


#import <XCTest/XCTest.h>

#import "KSCrashSentry.h"
#import "KSCrashSentry_Context.h"
#import "KSCrashSentry_Private.h"

static void onCrash(void)
{
    // Do nothing
}

@interface KSCrashSentry_Tests : XCTestCase @end


@implementation KSCrashSentry_Tests

- (void) testInstallUninstall
{
    KSCrash_SentryContext context;
    kscrashsentry_installWithContext(&context, KSCrashTypeAll, onCrash);
    kscrashsentry_uninstall(KSCrashTypeAll);
}

- (void) testSuspendResumeThreads
{
    ksmc_suspendEnvironment();
    ksmc_suspendEnvironment();
    ksmc_resumeEnvironment();
    ksmc_resumeEnvironment();
}

@end
