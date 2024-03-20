Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64ADC54E67
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:14:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rn2KV-0003WH-66; Wed, 20 Mar 2024 16:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rn2KS-0003Lv-Iv
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 16:14:28 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rn2KQ-0006MO-SD
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 16:14:28 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6e6ce174d45so288480b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 20 Mar 2024 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710965665; x=1711570465; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qr4Rve96DQNpnnXYnhSJVtnJiaf67aWVOBXxwm3NLJY=;
 b=XrmfJmhJBLngfVqb6R0nBIhBCFBzz/EwRvzJ4gDMTOSx2wu+kVYsAIAhHEn08IXrg9
 Da6atzc99FrrZoUQnclEfOk87n6HBHHZD0OhB6CxF1B47yQWVD9Ty0+t7Bg1NfkcqnJ+
 bBga9ZJ+wr/sQF+EzwxZXOOsVt6/+R3k883LYxg4CtZVvRE+3CYNn8xrrFbB1e4lD/th
 qOWWhwDku68NP3mvydmcbyG1kdkdV+nUf78pEHUErN42VL6BtpnAo0LfGoEIvMuL+i3p
 2FXnhCZpaMgRBR7UJtKd3/5XsDmaD4D6LpN/1e4Vun7jnv0zaroL/gsUUeUJXzi2if5G
 ETzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710965665; x=1711570465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qr4Rve96DQNpnnXYnhSJVtnJiaf67aWVOBXxwm3NLJY=;
 b=dvSzL001BIHc84FBw7JRSFDIreDcS31HD7RkRDFyTXajNFvokni1Kvvbj7Je5ZrPld
 pI522SfpvG4mh5tgxpUvIIvf702zl1AdKretnfqc1ycK+ucDSt/on3WcYWKJR2OI9N8y
 v75PSxWpHTeo+JUsQhcKYfKlBrETMqZN0dQQwzRJ8Shxbarsx0hWl5ivNVZymwq18mE3
 ui4yNN7nDsCftJzwQBD/n/4T9rsuGDHP2/w3NNc+Ek2hzZdogXWl8iht4gw4CVLgRVVP
 Dhvs8EaLN69Nqx9VG4ezl9yHKDvH2k4SHjacOQrisv5oJ2jWJUZAO9pWXGaJ8ASMWAAi
 LrVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2BHQTQ4RaKtk/SksuSquoMWwUrUz1wzG25v4TDlNevqcDbX9scEwAjth6ApQ/2E6r7aEWZYwfFMQ7w8WsGruwDcrc8Os=
X-Gm-Message-State: AOJu0YxT6AzvhPz+jm1QrhsRVB1UzXtINKXQewAlzsB2xHU+9Fly+HtA
 EHiEaiw44zbKEX4MLK9QjdnJpJflcMDbCzYDYD4TXQnsNd9ycNwJcOU8zeYfeQw=
X-Google-Smtp-Source: AGHT+IGsDC7olWCA59BzfzMdIGoZJui1YafOgXlSh2Pltfb+wJS0/X1QAwGVqptzpv3whqPuRXbubA==
X-Received: by 2002:a05:6a20:3b05:b0:1a3:495e:3f17 with SMTP id
 c5-20020a056a203b0500b001a3495e3f17mr5927225pzh.24.1710965665418; 
 Wed, 20 Mar 2024 13:14:25 -0700 (PDT)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a62e908000000b006e731b44241sm5360312pfh.42.2024.03.20.13.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 13:14:25 -0700 (PDT)
Message-ID: <0815dbbc-63ce-43b3-8712-02fe8a348bac@ventanamicro.com>
Date: Wed, 20 Mar 2024 17:14:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: rvv: Remove redudant SEW checking for
 vector fp narrow/widen instructions
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240320072709.1043227-1-max.chou@sifive.com>
 <20240320072709.1043227-5-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240320072709.1043227-5-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 3/20/24 04:25, Max Chou wrote:
> If the checking functions check both the single and double width
> operators at the same time, then the single width operator checking
> functions (require_rvf[min]) will check whether the SEW is 8.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 19059fea5f..08c22f48cb 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2333,7 +2333,6 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
>       return require_rvv(s) &&
>              require_rvf(s) &&
>              require_scale_rvf(s) &&
> -           (s->sew != MO_8) &&
>              vext_check_isa_ill(s) &&
>              vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
>   }
> @@ -2373,7 +2372,6 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
>       return require_rvv(s) &&
>              require_rvf(s) &&
>              require_scale_rvf(s) &&
> -           (s->sew != MO_8) &&
>              vext_check_isa_ill(s) &&
>              vext_check_ds(s, a->rd, a->rs2, a->vm);
>   }
> @@ -2406,7 +2404,6 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
>       return require_rvv(s) &&
>              require_rvf(s) &&
>              require_scale_rvf(s) &&
> -           (s->sew != MO_8) &&
>              vext_check_isa_ill(s) &&
>              vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
>   }
> @@ -2446,7 +2443,6 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
>       return require_rvv(s) &&
>              require_rvf(s) &&
>              require_scale_rvf(s) &&
> -           (s->sew != MO_8) &&
>              vext_check_isa_ill(s) &&
>              vext_check_dd(s, a->rd, a->rs2, a->vm);
>   }
> @@ -2704,8 +2700,7 @@ static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_widen_check(s, a) &&
>              require_rvfmin(s) &&
> -           require_scale_rvfmin(s) &&
> -           (s->sew != MO_8);
> +           require_scale_rvfmin(s);
>   }
>   
>   #define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
> @@ -2810,16 +2805,14 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_narrow_check(s, a) &&
>              require_rvfmin(s) &&
> -           require_scale_rvfmin(s) &&
> -           (s->sew != MO_8);
> +           require_scale_rvfmin(s);
>   }
>   
>   static bool opffv_rod_narrow_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_narrow_check(s, a) &&
>              require_rvf(s) &&
> -           require_scale_rvf(s) &&
> -           (s->sew != MO_8);
> +           require_scale_rvf(s);
>   }
>   
>   #define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
> @@ -2947,8 +2940,7 @@ static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
>   {
>       return reduction_widen_check(s, a) &&
>              require_rvf(s) &&
> -           require_scale_rvf(s) &&
> -           (s->sew != MO_8);
> +           require_scale_rvf(s);
>   }
>   
>   GEN_OPFVV_WIDEN_TRANS(vfwredusum_vs, freduction_widen_check)

