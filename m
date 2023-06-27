Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F06CEB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 04:09:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE00Z-0007Wm-L3; Tue, 27 Jun 2023 00:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1qE00X-0007WK-SZ
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 00:08:50 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1qE00V-0001l6-69
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 00:08:49 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-765ae938b1bso132465685a.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 21:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687838924; x=1690430924; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yf8KYm9SDdHCbvMq49yvPwBt6bCyUoPOrxML9Y2T6mw=;
 b=ZwvguHu2TdbTkFgoMUaxXLPUeTYJnhzKqQK2zf57qNwJlYE7hgcqe11Mn7R8Vh9WwL
 XkwWLwVGKFO1m//RZnt6Z1lxG19ZHtIxb6eR0kzjF14fgNCrSin/TBaqkUg/vSotud/r
 l6JM8Kdol+HOhTf/XuN+9W11b3CJeIuHVsVvsh/YKk06E+BZhNi6ozCdse9ENk9lxKH1
 sFllnV3YZ7Ci9X8dO6WPDTfyVp3pRV5Nlz5SMrbwW84IIMeBZt0rRttSLGGbz8MVYTIi
 bzER1GYokqQpdRGORspXeZQqUnl040IsVFuSwpFl9zCBFpjtjLkaOFQoxyX1T96cI6ZR
 yf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687838924; x=1690430924;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yf8KYm9SDdHCbvMq49yvPwBt6bCyUoPOrxML9Y2T6mw=;
 b=gYJL3LpT3MIAuulK2CQgUP4PmoFb/zLrBWAzTcx9VO4iQ285c9pMeiWL/qpvXDVLeE
 K9+Y3FxmbSCdIKD9KCt37c+9FX3nfND6eOAsyp9quGUCYIMGafjl/lLtB1isuw8aQYk8
 8w6Y4zpT3yd4Sh6oN+RvJiEMZgMJsQt46GyVl/Bn54EYgQkEclrnPlIAAO3iF+zswJOj
 glNXajIASDE8gyl0PRtxfXJZlstlgCy7Tp6BAA9Yz9ss4vjz9qyxAJ4E/rE9KuzuLYaj
 bmDdMsd98Ekrn6cIEoH3h1ib+FWRGxn/Y+76336idnELxjCyz1aCRKQwitW0eI+hdv6c
 oBcg==
X-Gm-Message-State: AC+VfDwXC0WvMXqACTB5m9uUx9d8sKnpisu3pKAEs8LjJw4lJPeV1Oel
 /Hrlo0Py3wWR/40Hr5L1y82RHJL6T57gOp4Z8Mg=
X-Google-Smtp-Source: ACHHUZ5FqGMKLxJfFONY3IKVLAq1woo1nDE3AeDAOQTrXE9Tfp7KHSu2vl4AxWz+AW/e2Ov3MkKRwg==
X-Received: by 2002:a05:620a:440b:b0:765:3a94:940f with SMTP id
 v11-20020a05620a440b00b007653a94940fmr19798737qkp.33.1687838924506; 
 Mon, 26 Jun 2023 21:08:44 -0700 (PDT)
Received: from x1 ([216.250.210.83]) by smtp.gmail.com with ESMTPSA id
 i2-20020a05620a150200b00759300a1ef9sm750770qkk.31.2023.06.26.21.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 21:08:44 -0700 (PDT)
Date: Mon, 26 Jun 2023 21:12:45 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, OpenSBI <opensbi@lists.infradead.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: CFP open for RISC-V MC at Linux Plumbers Conference 2023
Message-ID: <ZJphvbTsp6Q4Dfrq@x1>
References: <CAOnJCU+uMF-brnyjA1HLhupYPqL0ebOVu+ivrSn2AewuSrhtBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOnJCU+uMF-brnyjA1HLhupYPqL0ebOVu+ivrSn2AewuSrhtBw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=dfustini@baylibre.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jun 19, 2023 at 12:55:39PM -0700, Atish Patra wrote:
> The CFP for topic proposals for the RISC-V micro conference[1] 2023 is open now.
> Please submit your proposal before it's too late!

Thanks for posting. I am looking forward to it!

> The Linux plumbers event will be both in person and remote
> (hybrid)virtual this year. More details can be found here [2].
> 
> We will start accepting proposals after 15th August 2023 to avoid last
> minute visa/travel hassles.
> The conference registration sells out pretty quickly too. Thus, we
> would prefer to sort out the schedule sooner than later.
> 
> The final deadline is 15th October 2023 though.
> 
> [1] https://lpc.events/event/16/contributions/1148/

I think that page is from 2022 and that this would be a better link:
https://lpc.events/blog/current/index.php/2023/06/23/risc-v-microconference-cfp/

Drew

