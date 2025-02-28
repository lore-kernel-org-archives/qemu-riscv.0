Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83302C19776
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 13:23:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1to0Kz-00082I-Jz; Fri, 28 Feb 2025 08:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1to0Ku-00080i-Gi
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2025 08:23:28 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1to0Ks-00027l-U3
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2025 08:23:28 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-439a4fc2d65so21902635e9.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Feb 2025 05:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740749005; x=1741353805; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uF28SmLvpKTiy/3tp5O3rNCD+UYk3IysiMDNvDKQH+8=;
 b=PvsRTwj83l1OEYtBNv1mToHI6Skl72SvS5A2bhbVfqp2Vxai1SBkkd1rt30zcb5ysG
 GPO25GDVUcVCnxPFuvT30S6vg36Gu6IsuB/bNY0nTlFsDV/2qoaQyJXPW8ftzeKHHlCX
 lNDWndxNBKOfGlGxxbUEeOxybZSwDi3k2Uxsr6GLIfSXgeAoUePM4Q6FBkQPjW2SVl0s
 n6mG4NJYCq37Yi0P7pEQazhnB8J1PxL/e9hR7yvusN/P4jPISRYYUohIn439rXBBnQOF
 uKja1QP2MydZIz5Jdf6sK144ZIE66A4YsjNiGIQbx21KGPaPIalLHFhIkY/FrY8Bjamn
 F5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740749005; x=1741353805;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uF28SmLvpKTiy/3tp5O3rNCD+UYk3IysiMDNvDKQH+8=;
 b=u74I423d6v3ABSLNQUdZao5aRb0RtIL9MLxUsdocuRx0SmB+pbZtXpIQX2znQnrPUZ
 EKsrLIHqvEPh5apgiwLAVOCYFKdXMyEFUS9YmzurCdqPGfQjXqDJ0q2nRS9goN9Agvcp
 7VyHfP0H3AVmytQYZ1U4R0jfWDY/MRcd/UoxHHMKYXn8+cBBcg+tj//6FDhs88Fh2Id8
 dlqs8CyRnizHs0qmdgwT1JVQxBXPye1/wF3vjvZaq8bCvaS/8mtT9uocXsRaeHOJVJ2D
 dHRAlnmyRytMabGEKiV1PZZRqbrPqkrriQaRo9uriKxcPhYGXBaw8T7ZjXjVAxhsfW19
 iowg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK3eFYgfJj9+TjQw/D+VcURkn3AxQanO9nZNazYy7gbXOTYic6OV9XUHj6VLD0JnzndVZMVTvEh23/@nongnu.org
X-Gm-Message-State: AOJu0Yy0qZWTdNo7unFEcxsTAt5FvFdtNkVsXsHnoI9V+tJ6jE/mrtaN
 K/Uzi1wJ0PLg33HnNBph9ygVQDTXm57FttpfziTQ7WdAvxj1Mt0pNZUeEBZ6l2E=
X-Gm-Gg: ASbGnct2RivPLayNJJaQC98TSe/t55VMKG0m1mHqlPHVFp/aqO0UfYf+PgFxNnkmzg2
 /WoUoiumLyrz6dF3V43Qqlz1NihsmUDWdYmZNutAQuW28BdrvKij08CqHyGdYDWjt0YVHkVXpJ1
 0s8ExWpGwYCa1RmTYmTlZRJam4TIfFumFGp59bpYZgPp05qeNXFAtbXQB6Wqq6gD2bwIAIpdzUf
 Ah3hwE615Eey9tQF+NFuAux7CvLQ+FhYHdSfKlW1tbJOt0uIXTj4VctsSRKW6GtQi5HryHUqeMA
 +nP7//kaCgv8tA==
X-Google-Smtp-Source: AGHT+IFKFcOGD6WdRuG3rbltcnd8AQCdtKslYX7qnuN2EGn9aSIZZsCRi8LvR44ZfdgGVMUZh/EuwA==
X-Received: by 2002:a05:600c:4e92:b0:439:94f8:fc79 with SMTP id
 5b1f17b1804b1-43ba665be43mr37995565e9.0.1740749004339; 
 Fri, 28 Feb 2025 05:23:24 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b7a28bcfdsm56400305e9.40.2025.02.28.05.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 05:23:23 -0800 (PST)
Date: Fri, 28 Feb 2025 14:23:23 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, greentime.hu@sifive.com, 
 vincent.chen@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v2 4/8] target/riscv: add helper to get CSR name
Message-ID: <20250228-91bf13b18026d1640fd75255@orel>
References: <20250224082417.31382-1-yongxuan.wang@sifive.com>
 <20250224082417.31382-5-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224082417.31382-5-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32d.google.com
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

On Mon, Feb 24, 2025 at 04:24:11PM +0800, Yong-Xuan Wang wrote:
> Add a helper function to get CSR name from CSR number.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  target/riscv/cpu.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 616c3bdc1c24..df10ff63474b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -920,8 +920,14 @@ extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>  
> -void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
> +static inline const char *riscv_get_csr_name(int csr_no)
> +{
> +    g_assert(csr_no > 0 && csr_no < CSR_TABLE_SIZE);
>  
> +    return csr_ops[csr_no].name;
> +}
> +
> +void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>  target_ulong riscv_new_csr_seed(target_ulong new_value,
>                                  target_ulong write_mask);
>  
> -- 
> 2.17.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

