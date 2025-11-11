Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7A1CCFA18
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 23:37:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vIxv3-0005Ao-JA; Tue, 11 Nov 2025 18:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1vIxv2-0005AF-57
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 18:37:00 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1vIxv0-0007X9-FM
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 18:36:59 -0500
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-948a3979af4so13704639f.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Nov 2025 15:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762904217; x=1763509017; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RUpldihiRbLRoEl33gL7gMiTG9wTkgipOEM6Jz9Tr9U=;
 b=NYrE2aS+bzFoCqwn2PSP9K2G9sM5cEqulwXn8DK+75zlftxiGa+G1dUCagkvQqQbTU
 HtUMo+zKcylC9Rg+1U9C1Xz/+xtobbdP7fQQgJLp3ZnqEgz1beIrBHVkr5ApVAOIYwRl
 WsHFWVKq+rk8mcvCTiWl/sO00A7KmkzBBh2uFT0NIxAN2hVI2LleQdlbPaoIyCrBHDPr
 DBd4EIfHXiO/cfOoFpRZkpJfo2OngtsM8zY466ztLgG5TjiYdynLMOSTNRwpovpcJzSi
 gerkvUJVvnfWbQU/izUDUYmJssHTBccSMUoZuYnNlb4CRtFMMlCBNYJ8VrtylMGIgynL
 lGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762904217; x=1763509017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RUpldihiRbLRoEl33gL7gMiTG9wTkgipOEM6Jz9Tr9U=;
 b=qCQ9siqA6RpM+wUelVIeezXXrKD1PuwByGdnTKdavA3Z2HpREmgy1I6cbJRb/tDzfe
 LXL675u5QjgHPkOyWU9FSRhay/2grtE2+cY1/l7fzeShAoA4PoWyFB0kYJrWAUCOEf3N
 n5WYZSuwquQAq77RwGSkdGxxw8rNHVxACpgpGs81Dx7yKcY73P7OIc0zYcX7e46o9ATO
 dGpSiLnq1GNji+OGEzDWbuCGffJoUba7xnBdere+z58Fen7/kVRBfWiAcDNHqhL3pvQL
 ynr0tI2dvU52ynBNPz3hnPV6cPbftDPjFfEfsiRI6XNaf78OoykExhTuQrWfXUSAT1Y3
 0QQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkwm3ceTSz9iojAxIQYxqxh1bMWHyViRB5X1oZd3HrG4kvS/LIINj1SvgX/zP22TXvB5L+KFDCxGw5@nongnu.org
X-Gm-Message-State: AOJu0YzcsBKEdCvP0qDrNWrsvMbEL+xEo+eg00Jxxnaa5OBsCTb/pOMK
 FdyzekEHa2yT8+5IrtMzKg5KfUCNjOKcyr92kp5wMW0mbKLjmPWc9DjeKGRZSMwpHgA=
X-Gm-Gg: ASbGncvi1cj0M2kiUl0e3gwX1w++aSZo8g3pqN4XHNp9Sag713ViUTT2sh25sPQsMXT
 bFdIeF2Rey5BKLVXtV5RRRsCH1wB4Hh1XjT3aTryCLFd27fx4Qk/tws/MJVVjxFNKV6GxDbcquz
 eh7/Ox6nqk73qGmuHTCuXvwn4JDfu97wG6o5c/SBG5Q0OuKzLNZviGQZbnCIlwkq6xHeep3C7DP
 s8kLgA7tI7dLBzHnYc5swjI3anxc8H9wJNG62oACtVb4ATnkTi3F8nB12Uo80osX0mgfvlDaxNe
 E4Qhe+hd5zPqJ4gbD5qBpNQlT6t2Hg1Lo2F4TheuxT+ejoVsNnC38jmUBnpqWAmzA9q+xHpBnEd
 7HGtFt4+/ArMGf81dZTO0wmlD2EnOn6JtHYPd2O019hvhPy3Ka10ss7G5NuVwdhpK2KXqP0fxeA
 X5xQ==
X-Google-Smtp-Source: AGHT+IFAJ+pTl/Pcsj19aqB4cbnGnAMjW31h2Ug8XTHtTMK20vBpde88FeSRMVZOcULk3YaVEC0GsA==
X-Received: by 2002:a5d:974a:0:b0:948:7c53:2d67 with SMTP id
 ca18e2360f4ac-948b47d75dfmr540800539f.2.1762904216716; 
 Tue, 11 Nov 2025 15:36:56 -0800 (PST)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5b7ab14f4c5sm376706173.63.2025.11.11.15.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 15:36:56 -0800 (PST)
Date: Tue, 11 Nov 2025 17:36:55 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, 
 Fei Wu <wu.fei9@sanechips.com.cn>
Subject: Re: [PATCH v4 3/5] hw/riscv: experimental server platform reference
 machine
Message-ID: <20251111-a6e8ae9a0d6809ba0e62ba2e@orel>
References: <20251111182944.2895892-1-dbarboza@ventanamicro.com>
 <20251111182944.2895892-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111182944.2895892-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=ajones@ventanamicro.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Tue, Nov 11, 2025 at 03:29:42PM -0300, Daniel Henrique Barboza wrote:
> From: Fei Wu <wu.fei9@sanechips.com.cn>
...
> +static char *rvsp_ref_get_aia_guests(Object *obj, Error **errp)
> +{
> +    RVSPMachineState *s = RVSP_REF_MACHINE(obj);
> +    char val[32];
> +
> +    sprintf(val, "%d", s->aia_guests);
> +    return g_strdup(val);
> +}
> +
> +static void rvsp_ref_set_aia_guests(Object *obj, const char *val, Error **errp)
> +{
> +    RVSPMachineState *s = RVSP_REF_MACHINE(obj);
> +
> +    s->aia_guests = atoi(val);
> +    if (s->aia_guests < 0 || s->aia_guests > RVSP_IRQCHIP_MAX_GUESTS) {

The minimum is 5 for the server platform, so we should enforce that. Also
I suggest we bump RVSP_IRQCHIP_MAX_GUESTS since it's only 7 right now.

> +        error_setg(errp, "Invalid number of AIA IMSIC guests");
> +        error_append_hint(errp, "Valid values be between 0 and %d.\n",
> +                          RVSP_IRQCHIP_MAX_GUESTS);
> +    }
> +}
> +
> +static void rvsp_ref_machine_class_init(ObjectClass *oc, const void *data)
> +{
> +    char str[128];
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    static const char * const valid_cpu_types[] = {
> +        TYPE_RISCV_CPU_RVSP_REF,
> +    };
> +
> +    mc->desc = "RISC-V Server SoC Reference board (EXPERIMENTAL)";

We could (and probably should) version this machine type from the get go.
If we do that, then we could simply give it a version 0.9, which would
match the current spec. When the spec is ratified and this model is
complete, then it can be bumped to 1.0. Going that route would allow us
to avoid the EXPERIMENTAL "flag".

> +    mc->init = rvsp_ref_machine_init;
> +    mc->max_cpus = RVSP_CPUS_MAX;
> +    mc->default_cpu_type = TYPE_RISCV_CPU_RVSP_REF;
> +    mc->valid_cpu_types = valid_cpu_types;
> +    mc->pci_allow_0_address = true;
> +    mc->default_nic = "e1000e";
> +    mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
> +    mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
> +    mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
> +    mc->numa_mem_supported = true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary = true;
> +    mc->default_ram_id = "riscv_rvsp_ref_board.ram";
> +
> +    object_class_property_add_str(oc, "aia-guests",
> +                                  rvsp_ref_get_aia_guests,
> +                                  rvsp_ref_set_aia_guests);
> +    sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
> +                 "should be between 0 and %d.", RVSP_IRQCHIP_MAX_GUESTS);

Same comment about the guest file range as above (we shouldn't suggest
anything less than 5).

> +    object_class_property_set_description(oc, "aia-guests", str);
> +}
> +
> +static const TypeInfo rvsp_ref_typeinfo = {
> +    .name       = TYPE_RVSP_REF_MACHINE,
> +    .parent     = TYPE_MACHINE,
> +    .class_init = rvsp_ref_machine_class_init,
> +    .instance_init = rvsp_ref_machine_instance_init,
> +    .instance_size = sizeof(RVSPMachineState),
> +};
> +
> +static void rvsp_ref_init_register_types(void)
> +{
> +    type_register_static(&rvsp_ref_typeinfo);
> +}
> +
> +type_init(rvsp_ref_init_register_types)
> -- 
> 2.51.1
> 
>

Thanks,
drew

