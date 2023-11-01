Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1F5C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 09:19:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qy7O0-0008Bf-RC; Wed, 01 Nov 2023 05:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qy7Nv-0008At-Tn
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 05:19:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qy7Nr-00023N-6H
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 05:19:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso51426365e9.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 02:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698830367; x=1699435167; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=abM5PwZO1OsUVIy+bXnECh4D0+840LE3UAxhMouMzuM=;
 b=eibBJOSPpPulO0iWWob6k/sgA2NFJpVK7ICdfBQokUEsZ9JOO3HI35wF79W9pi99br
 dp3EiDreFW1Y++DEQ1Ugj4WDuaR39hibyhMLX0rTUu8E3jXiy1vttyVNNtcjSrAcCyga
 cZLLZ1iJdiXK1MIoDyUQ4YaA31J3JNqtSjLFaeMUO2c6G4B3oxFa0tA0hMJqqU5D3dHF
 TsWD3JIkVg2h402mw/FNMb+D46gpXNoYBYHqZkbgmDVbVmmcP/wqTxBe2PE6k88zLh3n
 +fpyPXlXJpRqIVHvtfbqwB8JH0xwU9C6rruyfQpAymDSU4ml7SB65pCRhbKrpBROr3zg
 2pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698830367; x=1699435167;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=abM5PwZO1OsUVIy+bXnECh4D0+840LE3UAxhMouMzuM=;
 b=SxwITq0OOhxsItXQN4QPLDCth76eoYgizNAmc5GYdg/MgxayBQDrjgX5sVaiaIb+K2
 u6zl8yKcLVMknXqogxVPseYhTLJwjM9LwSi05vzFWftLJAi/5Pjx3sFhJBh/g5du3Wp8
 5ph+h90f24QsZYm0m6OrCp/4bXIjiGxcOuUZL1/IhDp5MGQnG9n7q81e9Fj4hhD/GAft
 7zgcV2aumjAPz2q0rZ60HjdfXsKOk/lA9ljrXWfAc1Skj5ruTnOKNdRilFk0dPS+vqt8
 wSLr0yag1o+Ijxi6pRZva5AnGZQgb+/klG27/atUczQyn08oUMmU5hoOl4GAHpy7oiaJ
 TB1A==
X-Gm-Message-State: AOJu0YwUUUeTy8KVOFCTIeWL2aPVR0zpLGJj8v0KbScagpv6In1N0i/U
 EaZ1NsVGE4fxKxEqhb97CGKsSg==
X-Google-Smtp-Source: AGHT+IFOwGPoDC2J9pUonSvlvttH3lvWXE1PhllYzz5JlJlqX7RvQhq7g8xNDFKKO6BWIehYaLmwPQ==
X-Received: by 2002:a5d:4b46:0:b0:32d:8855:138d with SMTP id
 w6-20020a5d4b46000000b0032d8855138dmr11205320wrs.66.1698830367051; 
 Wed, 01 Nov 2023 02:19:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a5d6706000000b003232380ffd7sm3661996wru.102.2023.11.01.02.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 02:19:26 -0700 (PDT)
Date: Wed, 1 Nov 2023 10:19:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v7 16/16] riscv-qmp-cmds.c: add profile flags in
 cpu-model-expansion
Message-ID: <20231101-7e45796c91beaf0972b55f7d@orel>
References: <20231031203916.197332-1-dbarboza@ventanamicro.com>
 <20231031203916.197332-17-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031203916.197332-17-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32e.google.com
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

On Tue, Oct 31, 2023 at 05:39:16PM -0300, Daniel Henrique Barboza wrote:
> Expose all profile flags for all CPUs when executing
> query-cpu-model-expansion. This will allow callers to quickly determine
> if a certain profile is implemented by a given CPU. This includes
> vendor CPUs - the fact that they don't have profile user flags doesn't
> mean that they don't implement the profile.
> 
> After this change it's possible to quickly determine if our stock CPUs
> implement the existing rva22u64 profile. Here's a few examples:
> 
>  $ ./build/qemu-system-riscv64 -S -M virt -display none
> -qmp tcp:localhost:1234,server,wait=off
> 
>  $ ./scripts/qmp/qmp-shell localhost:1234
> Welcome to the QMP low-level shell!
> Connected to QEMU 8.1.50
> 
> - As expected, the 'max' CPU implements the rva22u64 profile.
> 
> (QEMU) query-cpu-model-expansion type=full model={"name":"max"}
>     {"return": {"model":
>         {"name": "rv64", "props": {... "rva22u64": true, ...}}}}
> 
> - rv64 is missing "zba", "zbb", "zbs", "zkt" and "zfhmin":
> 
> query-cpu-model-expansion type=full model={"name":"rv64"}
>     {"return": {"model":
>         {"name": "rv64", "props": {... "rva22u64": false, ...}}}}
> 
> query-cpu-model-expansion type=full model={"name":"rv64",
>     "props":{"zba":true,"zbb":true,"zbs":true,"zkt":true,"zfhmin":true}}
>     {"return": {"model":
>         {"name": "rv64", "props": {... "rva22u64": true, ...}}}}

Nice!

> 
> We have no vendor CPUs that supports rva22u64 (veyron-v1 is the closest
> - it is missing just 'zkt').
> 
> In short, aside from the 'max' CPU, we have no CPUs that supports
> rva22u64 by default.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/riscv-qmp-cmds.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
> index 5ada279776..205aaabeb9 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -116,6 +116,19 @@ static void riscv_obj_add_named_feats_qdict(Object *obj, QDict *qdict_out)
>      }
>  }
>  
> +static void riscv_obj_add_profiles_qdict(Object *obj, QDict *qdict_out)
> +{
> +    RISCVCPUProfile *profile;
> +    QObject *value;
> +
> +    for (int i = 0; riscv_profiles[i] != NULL; i++) {
> +        profile = riscv_profiles[i];
> +        value = QOBJECT(qbool_from_bool(profile->enabled));
> +
> +        qdict_put_obj(qdict_out, profile->name, value);
> +    }
> +}
> +
>  static void riscv_cpuobj_validate_qdict_in(Object *obj, QObject *props,
>                                             const QDict *qdict_in,
>                                             Error **errp)
> @@ -220,6 +233,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>      riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_experimental_exts);
>      riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_vendor_exts);
>      riscv_obj_add_named_feats_qdict(obj, qdict_out);
> +    riscv_obj_add_profiles_qdict(obj, qdict_out);
>  
>      /* Add our CPU boolean options too */
>      riscv_obj_add_qdict_prop(obj, qdict_out, "mmu");
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

