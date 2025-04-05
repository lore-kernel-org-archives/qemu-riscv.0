Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2703EC3601A
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 09:18:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0zet-00020j-EL; Sat, 05 Apr 2025 05:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zeo-0001zp-BF
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:17:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zei-0008HD-9A
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:17:41 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22423adf751so28182245ad.2
 for <qemu-riscv@nongnu.org>; Sat, 05 Apr 2025 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743844652; x=1744449452; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SN7LGVtl83fK2nqOgSAHi243TMHXD8T8klAOIrph1wY=;
 b=Ga7W1dKj6AfauvoOsSp7+s6Qn7YsIKviljStu0Ds/I70fGVKkeOEjxKveL7EzW2hFM
 N7xAp376jSiOoDtcrLokhjsLRLPGLPwya6PVk8c+EmxI6XkpPCPI/mblVBapEwJxHEx4
 dpOi504MtpkDhhYqBvSyzqP0h8xUxHMvtWpBsH9gWtQfm8Y958TKLorLiU7qDjiaD0uC
 d4S6KFApkGT1WOWlEX6nSKJdgAw2TTWrh8NTjvm3GROK0XyauXxweZf4qiQX1eP3bwE4
 huI4og0T3VHYlSAmKCb+YSdVbKbSsuSwYHHddz+BYfBwxoDDIL9yA/6zMJtPRuZB1Wr+
 ibDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743844652; x=1744449452;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SN7LGVtl83fK2nqOgSAHi243TMHXD8T8klAOIrph1wY=;
 b=uwodxX+DD23TTT9qN+lwzQMgAkE4W83r7qu8Fl2DrhRuM1a/+sW/csuBS4bF4lZXMK
 DfYNHljqCZmarVPqOf216Ud7bvziW4pezdIKhDSOf67UyUSiV+tvErnzEG4uIFh4XK3u
 eNM3r+pkdiRYJU0EMjROGLMG/rllSc0tHZwkR81TXy9tImbau+UeFCARdcOI7Wwct8PF
 QULaVH444f9J/g0h+Dk7ft3fqOucKEzNGsVOcMclNtoHP7/ZDo+mW/vBpzS7GdDmnqpZ
 W75vBOQndtKmwyrWvx+ck7SjAObkNUbWxzU2ETPn5N6hCBQawCnnNYu6DrljrCgLu8vL
 mZuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXYSB3U9R0pmxS+sTiyD0MeM0WB2dcn7c8wyq1gtrgKPfdGC5qIFhaolJlwb3njPzu/AOV91v/ugwG@nongnu.org
X-Gm-Message-State: AOJu0YxZAi5fomaNsSuWYzPAKuSNS5C//Ov59Q43UvPlUafTeR4CevzL
 TLg0hr+MXSyMFYmlnEjigq5FhZh0d5B3qxnM+6zM2V1rkezIQhNik9yILGdCMWs=
X-Gm-Gg: ASbGnctQu16WuFFTMmMX59th19XjCZgs2V7YT8r3mYkCGoWo8ignXhNkDDqzZP2pqFY
 1qzjspWBxNRMOeg7OJ7YdU4tXJqDmTmm0UyKm5RJuUXPjwhCEOw8Qmfl2A9lIxUFNu6jnoOKmZV
 9L44E6ZKWptYm1PfcOlZ+Ey0HzrB4NkipaBXt+awmEiEnQq3Rw0SSzIFfMJosPoCFmeur0B7+JD
 MM+swG2PJxTs04VfF0un3RWauaJdy49VL3jRqySdg/lyFjNmLfyvARMnS+HoqLUselvsh91+GmO
 NKTaTyn2isYxEaAaDsq4cGXPoqNx1OZMt3NtfUKDWiUoYXeS0MuUD2AmusnH
X-Google-Smtp-Source: AGHT+IEFthKcnj7k5Y9qWmSfxkGt9XzErqdYSnOgiJlmljS30qStGtxj9DCN+1FY2lMCPhTAjVfjXA==
X-Received: by 2002:a17:903:22d1:b0:223:5945:ffd5 with SMTP id
 d9443c01a7336-22a8a0a3833mr88942105ad.32.1743844652540; 
 Sat, 05 Apr 2025 02:17:32 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af9bc41a84bsm4084448a12.63.2025.04.05.02.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Apr 2025 02:17:31 -0700 (PDT)
Message-ID: <6e6e4b9a-337b-4d5f-8aca-567cdc362f03@ventanamicro.com>
Date: Sat, 5 Apr 2025 06:17:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] target/riscv: rvv: Apply vext_check_input_eew to
 OPIVI/OPIVX/OPFVF(vext_check_ss) instructions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 antonb@tenstorrent.com
References: <20250329144446.2619306-1-max.chou@sifive.com>
 <20250329144446.2619306-6-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250329144446.2619306-6-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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



On 3/29/25 11:44 AM, Max Chou wrote:
> Handle the overlap of source registers with different EEWs.
> 
> Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
> Co-authored-by: Max Chou <max.chou@sifive.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 4a0c9fbeff3..3d02a2f9ec8 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -412,7 +412,9 @@ static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
>   {
>       return require_vm(vm, vd) &&
>              require_align(vd, s->lmul) &&
> -           require_align(vs, s->lmul);
> +           require_align(vs, s->lmul) &&
> +           vext_check_input_eew(s, vs, s->sew, -1, s->sew, vm);
> +

Please remove the extra blank line. And with your co-authored-by removed:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   }
>   
>   /*


