Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D92CD5BD1
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 01:41:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSmDi-00084Z-Al; Thu, 28 May 2026 21:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.neuling@gmail.com>)
 id 1wSmDd-00083y-FA
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 21:41:02 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <michael.neuling@gmail.com>)
 id 1wSmDa-0002b3-NJ
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 21:41:01 -0400
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-83538fbd0b2so5507577b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 18:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780018855; cv=none;
 d=google.com; s=arc-20240605;
 b=HDG3Y3C6JApEbAjL5h6772IvaSIp7fOgwJ/rx3REKLSs4iEhtEjGjQNM/UC7fsWOOU
 GIjsapHU8SEo9Bwu9xyx65CwxJaW3yFMbjq9rs2QQKswaJtctHAwJAi2BWXveJumpsYm
 2GB2QDrgZzVcYvsePwI1r8oOrsAi2oPoDX1Q6AYL5JiCq0lYP8P863qBIbxDcx0mttZn
 KXDD3tKKLX0F1PF3mzDBeK3+ABAsQWaxY472B66Dkv6eYM0jvu9q7jLM83pYFxpPKKfS
 kctXjUcOUDCX3lPzqQ3Tt8L2w3kTszb/MFOH//NHCuOXrnP2TKJPcWyzMI0PCzh5NTH1
 F68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version;
 bh=AKR2EmSnlGauzVtwUcxlQvD8kTi9ouZXx77NodRKYXw=;
 fh=r3RfSycj0C5onNgkpX3uuHzAdvUK6X8dgUw+mFKR1q4=;
 b=D0/frFATUJ/3XQ8o1xVSnirpctjbbZLaN23jq98q8hCvbwjzTlf536dMOcKynpSYzv
 8lYb6vTunbKfCuceJ3uCrzh9PttU6kEwsI1ODtRsHLui/G7taphe89vKzMtG5HWOQBRo
 0ybjZo97FuUrLrBbqR0jwLtdpwqPmV0jTiGWk6gx/1M1H9yb9bJYD4PAk4epzrCM7ruJ
 hyNsJLpBT589J98ED/eEtOVJ5yO7gnpRSA2+GgvNkk+wTNkDRrK7usGiiIDlwkfduP6D
 3+tyI/GPC8EZe7KAowOv5o1SAayRuQRDMJTSNNzRGdZBCdos1ruw65klClNVkcsPj/lS
 OoJA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780018855; x=1780623655;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKR2EmSnlGauzVtwUcxlQvD8kTi9ouZXx77NodRKYXw=;
 b=iPcidz5lvd9vtOsHYzc5MprJAB61dkFEBy7AVLCD4YbQp6fIXX4oMVmWpIPnNXfR5i
 x6YGJ0hW7YHWBaJWW6eZFdgVOqwcf++pEor0rOhvk0nmcPcXq0SCIOFbcrMNkszBde5G
 u2pLWk3Rhj8MI1VuHcAUzLMIbf35of9raKsgidTdVKp9wVXy1Wa7ODY83wgUyBDZR6hy
 9E67fhc948RTKqLuWRsx5qi+BN6V2/tmXYl5OAjsHx6hoxFlzNk52IHGYs1jAJfqkiPv
 47c4UQioL3CAhoMSBWleHxpB0+ekjBQ5Ct1RIXZdlq6bdRrKQkLFb6AauKnSGfBYucRq
 JFSg==
X-Gm-Message-State: AOJu0YyLroa2HeoWjtZYKPn6YhIyerOCwgBILRh2bROlP/IGlvttzXIX
 /p/ZK9mVzXxFuVpBoyPVmS09WIL4ktkYrrKSMaGNR0q+sFmpvdvqrPiu1B59xzPBV0InoF5RQgb
 mkB0Ocamv+HavqXNyv1qzDqchxZ0nRyM=
X-Gm-Gg: Acq92OEdKIwcfQ3iZpS1vI/ZjVE20ohgGqcjp5gMDsZDumxvLbfJgAaiLOTlT4RpBCn
 gnujZ6h9EZhlNa90gPgEOPFQeLyZBaIozzzNc+BZsSBaqyOYlA32oyWXnE96KNUj0rhlR8EQ3ro
 iquL/SfX/VCNkdp1m/C6oc0UNPhZzGxyc5EKa4g02HIUxBrAQmdPK2G+Uk4zDzrjEMEQe+vPuKB
 gRXvRBe/aDyDohxSGoywZ5Bx8D0+3lq+8flEzW/okACzur0IRUO1QXRwvCiHtrzNr7varPCYZsv
 J9pmqZdJSgEn7kiccjOQ5fasQP664g==
X-Received: by 2002:a05:6a00:178b:b0:838:20b7:40ed with SMTP id
 d2e1a72fcca58-84212d61ca3mr634130b3a.42.1780018855404; Thu, 28 May 2026
 18:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
In-Reply-To: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
From: Michael Neuling <mikey@neuling.org>
Date: Fri, 29 May 2026 11:40:41 +1000
X-Gm-Features: AVHnY4IdhcR11Odc4xJpadvW7t9itgPbCv4i-5ZDJenVDRyz3hIG_sMUG4vYcUs
Message-ID: <CAEjGV6xU=CuuAcRUAVoMZf4N-wvoL=sqFafB52hpzEY42YT4Ug@mail.gmail.com>
Subject: Re: QEMU RISC-V Call
To: Alistair Francis <alistair@alistair23.me>
Cc: qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.210.174;
 envelope-from=michael.neuling@gmail.com; helo=mail-pf1-f174.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

> There has been some interest recently about setting up a call to discuss
> QEMU RISC-V and the current status.
>
> So I wanted to setup a chat next week AEST (UTC+10) time to discuss a
> few things on a call.
>
> I was thinking 1PM on Monday the 1st of June.

Works for me (or 10am as Daniel proposed) and some of the Tenstorrent
folks in Australia.

Mikey

