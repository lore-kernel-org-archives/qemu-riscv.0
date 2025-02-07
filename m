Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296F3C02196
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 09:40:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgKq2-0004F7-PK; Fri, 07 Feb 2025 04:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tgKq0-0004EL-EC
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 04:39:52 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tgKpy-0000Yt-OK
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 04:39:52 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-21f573ff39bso5243785ad.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 01:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1738921189; x=1739525989; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DmbhIeP/hDHZRGV5hhOJVj18xkK3R97algwM7loxZkk=;
 b=F5/Aux6dHhN0kxLfqOcNJ5MiYrd0sfb0wf/rQALvWp715d4asSzRh+ltHdmgwppMZb
 aaF52NDGB4qsoKXtsqxD2C9x3HDAFRXV0mPkHDnFBrgJeajZ50+DoIBYm0hn7ZgupQkL
 NK7b/p5kSdCeqvPIERgk4jqjAXmDQoo65Mlya3ThNPAz45pD5miHr6NpDtstt0NYgi+a
 5y++5J3MjkW0BAA+DFI67spzNFgOYR3Llmz/eRCYgBJIUCLJBoC2+Dcl7/6Mvw7ZZQtU
 xDBu8cqVQ9Z36lMZJh6EXFJbjs9WcquqUk00+vXdSmmAwkt7SJVElaHtloPOydwJvln/
 ie5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738921189; x=1739525989;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DmbhIeP/hDHZRGV5hhOJVj18xkK3R97algwM7loxZkk=;
 b=B9EiMe4MLiC7rGJaJ5CoisVnj2BdHYcbuiFTXzzG4UnHYPemPmTMdhLvMOfNagS6FK
 2SZISTnDgoJOK0m00EP789ztNQpCpWQiF8WwoZ4mo2ZHziwmeGtsWKRKjulxAZyuPjll
 OujNN+2PbwSh8NURlxE8eYNBzHlx4OryzDD16BkUwamgNM6XBfVVDrRG2G+yewTE0eQz
 uZvrAhyHlblLawqeVrMoYJcnRI9xKkPtA+zQVMRSPcbeS+I/8aDx5BTflXHu6L3KUxXU
 qWmwrRNe9brzNUivhi9kJRSIeqvihCV1JkW3xdtIrsAN9olHydc8wVBkfNK2unnMEHaV
 mGEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHhmw8Ve8K1Uo1xEglkhVDoDjeE/hI3goFGoJMCx++Y2NZ3hAnW7vaMBuW/Ta3u9IvDX88pGwVoKZX@nongnu.org
X-Gm-Message-State: AOJu0YzrSi2GIIYYSCgjeePDeTBKKQxJLWpslNDFDvsZE7rwnYrgyHJp
 DwZQxWcAxKjeSieSOYx16kkaKsVVOkShD7q4vR7WmUEPHDFkKqPhbwANtfJbL1M=
X-Gm-Gg: ASbGnctWn1rRqn/W1rxeAZ5RtlycTjSHUcSj52yVwzzjkgJOX6MJT1TGufgo56hXl+6
 BJ7LZxR0JXY5qL0/YK1tj2EV6hCLym+oXo3qzQRNpGCYxv8S5uJRkVZ5+jnch4YhdX/GcqlrilV
 HJSC0f3WFXmceLprheMI9cWDvmyjnwrjFOOi8pdOetOM+POMKHdAhgUyNbVfbLwrsDmKq+Eo/n/
 JVPvaBzELccBWGmxNdve/eOd1Ew79aFdlwMB8iPwcDz7i8ycjqcjqxxD4L4auRqkpeKCduafbOs
 i4d90xbqYCpRFoYdrIQzCPONS3L+/DDV7c8e/STaSFDpt12PWB3F8XdmIPje1SLkJSrJ
X-Google-Smtp-Source: AGHT+IFK1KoP5CW6Ml9zNTDseosHv8HKm6SD2IXLbR26cctBVS/Kgz1ZS42d//6cHTKXMhAEE6aiJg==
X-Received: by 2002:a17:902:d512:b0:21a:8d8c:450d with SMTP id
 d9443c01a7336-21f4e7810e0mr37169035ad.53.1738921189330; 
 Fri, 07 Feb 2025 01:39:49 -0800 (PST)
Received: from [100.64.0.1] (218-166-198-8.dynamic-ip.hinet.net.
 [218.166.198.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653baa8sm26472175ad.73.2025.02.07.01.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 01:39:49 -0800 (PST)
Message-ID: <066a65dd-1dff-4b32-b2e2-89141ca0c0d7@sifive.com>
Date: Fri, 7 Feb 2025 17:39:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] target/riscv: handle vslide1down.vx form mask and
 source overlap
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250126072056.4004912-1-antonb@tenstorrent.com>
 <20250126072056.4004912-6-antonb@tenstorrent.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20250126072056.4004912-6-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The vext_check_slide function affects the 
vslide[up|down].v[x|i]/vfslide1[up|down].vf/vslide1[up|down].vx
instructions than the vslide1down.vx instruction alone.
Therefore, it would be more appropriate to update the commit message to 
provide a clearer information.
(PS:perhaps, using the “vector slide instructions” to replace the 
specified vslide1down.vx instruction would be better.)
The patch 06 also has the same issue.

Thanks,
Max


On 2025/1/26 3:20 PM, Anton Blanchard wrote:
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index f5ba1c4280..a873536eea 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -609,6 +609,7 @@ static bool vext_check_slide(DisasContext *s, int vd, int vs2,
>   {
>       bool ret = require_align(vs2, s->lmul) &&
>                  require_align(vd, s->lmul) &&
> +               require_vm(vm, vs2) &&
>                  require_vm(vm, vd);
>       if (is_over) {
>           ret &= (vd != vs2);


