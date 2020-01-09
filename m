Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipMAK-0000oh-Ft
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jan 2020 19:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ipMAG-0000jL-4z
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:59:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ipMAB-0001zF-3W
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:59:08 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ipMA9-0001uA-PE
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:59:02 -0500
Received: by mail-pl1-x642.google.com with SMTP id a6so1825583plm.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2020 16:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=AeWzA6tBi6Il/1HonnJTvliIFQYNhq8at6n6ZvU3U58=;
 b=A4ZMx/VWDLZehxggBDieHWn91Xt/aHqayDb127at7ERq1+XIK4wusMpKzO6oSBHazH
 ltO32OKlsueshML5bQ93EYfgMfJXR8Q6zRa334TdlVd6XJPOV73vgWBYWwbMFqPsYo1j
 3a7VChkATEtPR7AY7pOxqPawDdTrlKnS9wUOE87HLrlm6cQVlJPCnt1Pfsq7LeMZhp0n
 ebgmk7emp0yrEfuTiGewWdS0/8L1R0MOTF3rQ8uRJL5mcj0CpSSqHolcUOtuZzo8nPTj
 df+quYqon5DGbA02ZWYnw6ZZoSOQ5SDdQbecI2sl6QatQZjuTvpPEHdkS8twqS+7Gg4m
 HxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=AeWzA6tBi6Il/1HonnJTvliIFQYNhq8at6n6ZvU3U58=;
 b=edbjSykLi6UC2a73C2vjFODjIW0v0G5RaWQQRdGhaHh8NiDjhjRXAApeGlGVbHEnrS
 k126+qLenOshYrlvu2KfNB4K6DRCKYS3alSs7z4ZKuyic5nv7cGkm9m4gbGsQTEpbORi
 LJPCDt6x4rf7mc4oiBr+ibgl+ylbj/+oVc7DLdJm1G9YRkR9AAHLd63VX9KYv43sQMc6
 d+Q3E20gfuKfBE7OTEkPpiYUvETWC0F9WDwkb/SlPisvsKut/ZqSU1m5K6+dg7Kxb+K+
 S5a44O7Gfgop46R70RA8RNFQgmJiJRkxo30ByUGlmYKMq8kaWUxxW9GFjeFQo/PtT/AX
 KpkQ==
X-Gm-Message-State: APjAAAVGHl0N0Kpwf2qK/kvWkRjx3WY211W/vuf8ZFHXP6+wOocNU6M9
 dSzR3onIPSuzeYN22mWdIWWsCw==
X-Google-Smtp-Source: APXvYqw2ZzI+tjvZ1jd9qihxiDExql7i7WDYNkFZcfoNT/bTbigEMSnoMpsUVuuQbmQIFbOLoZvp6A==
X-Received: by 2002:a17:902:8bc4:: with SMTP id
 r4mr8487712plo.291.1578531539121; 
 Wed, 08 Jan 2020 16:58:59 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id i17sm5038140pfr.67.2020.01.08.16.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 16:58:58 -0800 (PST)
Date: Wed, 08 Jan 2020 16:58:58 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2020 16:58:47 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 29/36] target/riscv: Respect MPRV and SPRV for floating
 point ops
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <f1725ddb8d69edf68ddd2d6e1b6688cd7b2ba550.1575914822.git.alistair.francis@wdc.com>
References: <f1725ddb8d69edf68ddd2d6e1b6688cd7b2ba550.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-a52e4450-6d1b-4035-aa67-4eb899412231@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jan 2020 00:59:11 -0000

On Mon, 09 Dec 2019 10:11:56 PST (-0800), Alistair Francis wrote:
> mark_fs_dirty() is the only place in translate.c that uses the
> virt_enabled bool. Let's respect the contents of MSTATUS.MPRV and
> HSTATUS.SPRV when setting the bool as this is used for performing
> floating point operations when V=0.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 1d879b34db..dd93e12b45 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -748,7 +748,21 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
>      ctx->priv_ver = env->priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
> -    ctx->virt_enabled = riscv_cpu_virt_enabled(env);
> +    if (riscv_has_ext(env, RVH)) {
> +        ctx->virt_enabled = riscv_cpu_virt_enabled(env);
> +        if (env->priv_ver == PRV_M &&
> +            get_field(*env->mstatus, MSTATUS_MPRV) &&
> +            get_field(*env->mstatus, MSTATUS_MPV)) {
> +            ctx->virt_enabled = true;
> +        } else if (env->priv == PRV_S &&
> +                   !riscv_cpu_virt_enabled(env) &&
> +                   get_field(env->hstatus, HSTATUS_SPRV) &&
> +                   get_field(env->hstatus, HSTATUS_SPV)) {
> +            ctx->virt_enabled = true;
> +        }
> +    } else {
> +        ctx->virt_enabled = false;
> +    }
>  #else
>      ctx->virt_enabled = false;
>  #endif

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

