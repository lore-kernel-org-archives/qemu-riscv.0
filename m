Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3B0C02196
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 09:38:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgKo2-0003Sj-Cx; Fri, 07 Feb 2025 04:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tgKo1-0003SK-C1
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 04:37:49 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tgKnz-0008RE-KD
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 04:37:49 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21ddab8800bso25967025ad.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 01:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1738921066; x=1739525866; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mzXxKznU5wkiSSetmU7ldWcCIS+7alLdzy9VWcC7YNk=;
 b=R4Xd7faMkj9Ass8RWsW03smYUszEvdXlBtpit0QayufHjyiXUjYchmjQ/3UaOLrh6E
 bDeFg37jkxyiUSEA0dW6j8r4ml4r/DQOBp3/Bd4PtKUWitkRH+VoblNQrBoGZDG1JIzV
 Xblq50eK73MeFbxeFdnuf391/iq4Olgxsa5aFkgmpX13Y6szC55D87hiCRztW3e6/wwz
 Ihs/viU5f90D8hyNnJc92e/daAnCX9OU3RtKArDqnjwHGAGoyDc61Yz3+dIqyp3jw2H6
 i3qA/+SyVTOT9Mri6kJL6Z6p0whScOx89CrIhLg2mc1zw2B1wJr5balGQn7KQ9uMcatS
 l7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738921066; x=1739525866;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzXxKznU5wkiSSetmU7ldWcCIS+7alLdzy9VWcC7YNk=;
 b=WE0+fLkXwDVONPIOUGiDXZ2NMTslhBSQt5q101HSW4Hwofq+wOY7WND85gMnzQWnt6
 XRk/MydK8/4tLTHCueIyE1Tnnd3HlmrVial0mEQC7TpakxTFLvxMakp19QE8Ed81ZKDu
 0FMj64j5ZAz1mmchn1n51L7VROgwNFCye4L7gy5b46wwPyBPp9ENHsBQL5rM3INDIlJl
 MDCXE/3MIChnDglIrXsEuUC3v0zbe1M9Bwo/rDtlokrIRdDhLfMdaDvT1XOBDgGohjSs
 eIOxiIBJxiUh//vDMniNtzLxLd4Tyo/A0d+55kg/s4A6U8cFjk2crPVkGH8LQcJFddZq
 bElA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmugVKWrKnCt0L56rapkGjdk1gtM2pW+a+nt1+9/+osUJgyh6Z96PkSFqJSXRi6ZPN9rzBVj9S/0fd@nongnu.org
X-Gm-Message-State: AOJu0YxEeADa02Tn8Vrgd9+D+BtPgRq6aWnPvXG5RUN9wYa9Q0hlwBQB
 bnPkIA900Sfi7xoUwEx6oufwJmgjySV7h1bZBYUwoqAjA7DYiP4MYz1HDRA/pWk=
X-Gm-Gg: ASbGncvWayNCpbe2gIJgbFSwcuQRw+w+DjkTcCvPTgiba9zGe4+SNWtK6adWv7GeYkY
 bZzNRDEnC4KKVrmH127VAIbuUiCURRhiflqRBHfkKYLPdL80Jsp2PU39ivfq8H3T+YL1SG/Rio/
 ynTxpndWmwXw4YQMhbjLk5A5KaLSQwnS89uKrhuUhukFzr9XejWiP5BBd/PVLCm4cZVc8pa2akf
 db4pU/fEGJb/s0h6qQrjhUt8CV55s8/WPHWkJ/a4VTF3zoqrQrd0G/ZQY0BHFU20s9IGWkQy3/h
 wX1Xi/nck7E/5qMYBo0iGp0XZ4M3Oz0+t2RXCcSZX6EeHK2nGc6gf/Fyl9Zz0d6kmREi
X-Google-Smtp-Source: AGHT+IHXO6mGjLOaINxlIX8kU+Y5BgF7qU3dtVvRcoSWg8B894Djlw/zMw79Y/uvRvfsUsLNUYmNzg==
X-Received: by 2002:a17:903:1a2d:b0:21f:2a2:3c80 with SMTP id
 d9443c01a7336-21f4e1cb924mr37386475ad.8.1738921066005; 
 Fri, 07 Feb 2025 01:37:46 -0800 (PST)
Received: from [100.64.0.1] (218-166-198-8.dynamic-ip.hinet.net.
 [218.166.198.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3687e0casm26460375ad.174.2025.02.07.01.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 01:37:45 -0800 (PST)
Message-ID: <3236bb5f-644c-439a-ae20-d65d7938f0c2@sifive.com>
Date: Fri, 7 Feb 2025 17:37:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] target/riscv: handle vadd.vx form mask and source
 overlap
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250126072056.4004912-1-antonb@tenstorrent.com>
 <20250126072056.4004912-4-antonb@tenstorrent.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20250126072056.4004912-4-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62c.google.com
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

I think that the commit message could be improved for better clarity.
The vext_check_ss function affects more RVV instructions than the 
vadd.vx instruction alone.
(PS:perhaps using the category (OPIVX/OPFVF/etc.) to describe the 
affected RVV instructions would be more helpful.)
Additionally, the patch 04/07/08/09/10 also have the same issue.

Thanks,
Max


On 2025/1/26 3:20 PM, Anton Blanchard wrote:
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index c66cd95bdb..bc2780497e 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -382,6 +382,7 @@ static bool vext_check_ld_index(DisasContext *s, int vd, int vs2,
>   static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
>   {
>       return require_vm(vm, vd) &&
> +           require_vm(vm, vs) &&
>              require_align(vd, s->lmul) &&
>              require_align(vs, s->lmul);
>   }


