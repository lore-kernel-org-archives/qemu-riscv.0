Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D64BC19F2E
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:48:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tnfBI-0005jQ-8Y; Thu, 27 Feb 2025 09:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tnfB9-0005fU-HE
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2025 09:48:01 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tnfB5-00010n-KW
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2025 09:47:58 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2234e5347e2so19735285ad.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Feb 2025 06:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1740667672; x=1741272472; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ouxuFR+qq/ps7rpmIIc2v4Y4JNhrl6fTBDzTfB1UsJU=;
 b=JTrYrI5/5brY7tTISQQ8fIhyS9vaQ1/492eH8lolApTF8Lj5xsVNPVh6eOApxtUSMI
 XippYwJ2bor1Ly1xNb1AzDpXW2OLY7RAl48EcZ7us2H0YNGY4utujaf5SCJtiGY3dRzY
 GCLWvSGqa990Udybr6FyAAWdMfobV3PFycweZud7dRQedq23ssFhkEoee1cJi1hSGW7X
 mQtgoDggAiLaHdBXxx0fn8RnXelHuL3MXfR2bijSZHrOAyM9cK+W6FmW6IID+/Z2cffI
 DfNXGmwJVy1j74mMNxM0MAwlLoxRz+z0cExe3yOEZ6wJCOjYEmr4lmFuBrF+pEmdqvTT
 mOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740667672; x=1741272472;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ouxuFR+qq/ps7rpmIIc2v4Y4JNhrl6fTBDzTfB1UsJU=;
 b=wwD0xTanqFVpg2ig9+rB+ifv1ZahcoTwSconSTs3FyHleErLC4BDG8vidtTzSi7phT
 osx3g0zlTm+77GWwf1aeUisZQR4tnjAq2L59WsXMK9MHUpNIARCc5cW6o5l81IAKp3Mw
 Due0ViwPdwreSVntlAFdGGaBm4O4Mteol26E6Bcb40h4AEgulBRMz2UARafMYS5xY8UT
 WdZAXIyb9EMdM3f9tytaooQeCoLWhkEVHHfzyqpfe6IqPaeBA1Ms5IQXf81qmh/DIfZh
 RMQEftc3ScW6gCNzEsVzuPQIrIe00RZVsJV93jmWzzWKuSvYQNrijZo4Ebs351xHxd9c
 8Zrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKbhU+NA4s5Q5skRm2jE/9hKNlE+vhOZvQl/diXwCtUDI46a857hPZ9gANiQ+ZphtXeXlc8fYOGkgv@nongnu.org
X-Gm-Message-State: AOJu0YyxIzGU3m19Sn95+fXUXDgWTqgTpIL+dCUaQwtWuILidQ7+TzyE
 W4loIl7NMts4XcapOjVmviSVaBSr/0KQLXLHJJGUaR5B3nGAb+5Gv1GNUaWOkAo=
X-Gm-Gg: ASbGncuJpzcJk0W6c+yR+a+on3wIzeOb/tK/ClvC8nXSwnZ86PSiEeYjQQX5wkbVDuu
 82pmI6X3SL1byfZIjiJghkB+FOaPXqrowrlcu5yzZ0H2VWhPvPysrStX2Jlb34sdVrR6aqeUp31
 0VImS281Zws0WNW92I9dhU7vfa8cg66LabrnmjRAiw7Cx7mTUxSw0/Zvpca5gE6JBUAG/BejU8u
 LuSqB1phFof7+8KUNk4oRFIfyjZY94KuWBztvub9K8e9uRTWQj8m9UbCel2SDxfFHcSDlDNyiYZ
 Ya2B9m5P7yUZ8LyXwPSBjFlNLPoS6RoDqOjvp/W6kdsfQa0B6Ow4JyWi3ByHW0v8f/6VJsBVMFb
 KC5I=
X-Google-Smtp-Source: AGHT+IFmlQ51ucfjjSQZormO6+bFNmvYorBpRmdL6Zrhe+jSpBUtjmVEvEsv/XCMXW2UxiGjXQIcbg==
X-Received: by 2002:a05:6a21:3994:b0:1ee:d317:48e9 with SMTP id
 adf61e73a8af0-1f10acf5fa9mr13499151637.6.1740667672217; 
 Thu, 27 Feb 2025 06:47:52 -0800 (PST)
Received: from [100.64.0.1] (218-166-197-4.dynamic-ip.hinet.net.
 [218.166.197.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aee7dec3ce0sm1334227a12.47.2025.02.27.06.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 06:47:51 -0800 (PST)
Message-ID: <53591e3f-78d2-463e-b857-0b7d170b84e5@sifive.com>
Date: Thu, 27 Feb 2025 22:47:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] target/riscv: Fix some RISC-V instruction corner
 cases
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250126072056.4004912-1-antonb@tenstorrent.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20250126072056.4004912-1-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Anton,

I hope you’re doing well.

While reviewing this patchset, I noticed a few missing parts related to 
the mismatched input EEWs encoding constraint.
I also found a few other rvv encoding issues and planned to submit an 
upstream patchset to address them.
However, I think it would be better to merge these fixes into this 
patchset to maintain the series’ cohesion and keep up to date.

If you agree with this approach, I can integrate the fixes and submit a 
v2 of the patchset.
Please let me know your thoughts, and we can discuss the details further.

Thanks,
Max

On 2025/1/26 3:20 PM, Anton Blanchard wrote:
> This series fixes some RISC-V instruction corner cases, specifically
> illegal overlaps between mask and source registers, illegal overlaps
> between source registers and illegal overlaps between source and
> destination registers. These were found by looking at miscompares
> between QEMU and the Tenstorrent fork of Whisper which models this
> behaviour better than Spike and Sail.
>
> Anton Blanchard (12):
>    target/riscv: Source vector registers cannot overlap mask register
>    target/riscv: handle vrgather mask and source overlap
>    target/riscv: handle vadd.vx form mask and source overlap
>    target/riscv: handle vadd.vv form mask and source overlap
>    target/riscv: handle vslide1down.vx form mask and source overlap
>    target/riscv: handle vzext.vf2 form mask and source overlap
>    target/riscv: handle vwadd.vx form mask and source overlap
>    target/riscv: handle vwadd.vv form mask and source overlap
>    target/riscv: handle vwadd.wv form mask and source overlap
>    target/riscv: handle vwadd.wv form vs1 and vs2 overlap
>    target/riscv: Add CHECK arg to GEN_OPFVF_WIDEN_TRANS
>    target/riscv: handle overlap in widening instructions with overwrite
>
>   target/riscv/insn_trans/trans_rvv.c.inc | 139 ++++++++++++++++++------
>   1 file changed, 108 insertions(+), 31 deletions(-)
>


