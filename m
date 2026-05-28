Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C788CD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 15:02:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wScFU-0005GZ-83; Thu, 28 May 2026 11:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1wScFL-0005Eu-H1; Thu, 28 May 2026 11:02:08 -0400
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1wScFJ-0001gQ-La; Thu, 28 May 2026 11:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=EQW+SxMyZYYaIfWsODOywavMYAUFlp0gyebcxOJIKxA=; b=SvAYcdGO82mHBEY
 762Fk92vh8Av5U8WI3lG/v8eJGsBa7rau0zNoTUYeUbJzNbb+zoa0tCs4ITrN+de8Aa80znGFvi9N
 pCdjcPK9D5eWayMej9puvHJSSvvTiPX/u5tilGmAeHceLwPDiSycJJM796DC78tQEs2Zg3yz5yNmi
 Us=;
Date: Thu, 28 May 2026 17:06:43 +0200
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
Subject: Re: [PATCH v3 00/14] single-binary: Compile hw/riscv once
Message-ID: <ahhZ32B8XCGfTspm@hive.localdomain>
References: <20260520-hw-riscv-cpu-int-v3-0-d1123ea63d9c@rev.ng>
 <81244594-ec27-4cef-85bf-60a4f7bd08ca@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81244594-ec27-4cef-85bf-60a4f7bd08ca@linaro.org>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 27/05/26, Philippe Mathieu-Daudé wrote:
> On 20/5/26 15:12, Anton Johansson wrote:
> 
> > ---
> > Anton Johansson (14):
> >        hw/riscv: Register generic riscv[32|64] QOM interfaces
> >        hw/riscv: Add macros and globals for simplifying machine definitions
> >        hw/riscv: Filter machine types for qemu-system-riscv32/64 binaries
> >        hw/core: Add riscv[32|64] to "none" machine
> >        configs/target: Implement per-binary TargetInfo structure for riscv
> >        target-info: Add target_riscv64()
> 
> Queuing first 6 patches (addressing rth comment), thanks.

Thank you!:) Must have missed Richards comment huh, by bad.

-- 
Anton Johansson
rev.ng Labs Srl.

