Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654D7C83F10
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:44:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhxs-0005i0-C8; Thu, 31 Aug 2023 09:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhxr-0005fn-Dp
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:44:03 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhxp-0003cN-0x
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:44:03 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-500d13a8fafso1628691e87.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693489439; x=1694094239; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O/NnKczXggCe9FEX+f3YRwtOiddV19c1MJwyPW4Ea0c=;
 b=WtM0SUHmrGgi4DQ37xv79hAxjf8poGbqgsGTtQ5mnvOdz0ZnRQZ9LF7FeyyTM6CcyQ
 MU0tDho75NXLvdNrW3Hb8iaSH1492fcNACdTY5y7PwDUgIfP/+t/r2UkTbFtDU8qknNJ
 vqjLlhYhqPAVFpCIzqktoz2x/iJg0g9w1bPVJW1AIyb/jM+xCZx0YSdmPkw956+V5Nln
 BJmzcr3lYp7uAVyrtkHqNpSFRhmuZWoOanYHycbgZBHmrrDNsRIxnPL9P6/yDMQ5GZeb
 g3UsB09c8N/MjHHz7O6XeM+zfg1pAHbft81FZiLIZ0y0S+Q7CAGn8jZ0Ki/WBiT50Wso
 YZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693489439; x=1694094239;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/NnKczXggCe9FEX+f3YRwtOiddV19c1MJwyPW4Ea0c=;
 b=XLdQhrU+fPRTXLQXam57oTo5phT45rhL3GNoq+0Hzmwl13Mxute3STRgxRIXf+uh7r
 rEQ8DcEb4USwiMvcrNTixEfzLfzri7ylq3d1eJFDXrFT0puD3ZK9BjBgL6BfkSMDTfwv
 w2iDG2VGP1696smIEs+OIM32y8J5CXH5rXJd8rAOJlxnnVuTEu8eoJMkc04voGza5UN/
 znl1d+xQcNKZkTv2cvDVcqT7VGTdahmOduVnYmgJC0U6UqxngBRtzrmLMZaEfToFwh54
 /w7qo3lTuK+1ASdNKy61UbL4ujQEsmoGKiWRuIcLm6hM9kmhYXKBKFUql6H+8Jxc8Nhj
 MtDQ==
X-Gm-Message-State: AOJu0YxsqeaSY0Ao6xddCw6O6piY5ZUSBuGo86Yoi/JoBLt6SxeqPei2
 GHWbgkvgqsWAAzdYkeA4B6FJW3o0k6tbIrFpQTw+MQ==
X-Google-Smtp-Source: AGHT+IHvr8WWIttVjcaKGgncj4DYv6iqSYNsItg/p4Y+eE4DSG0ioBY/Or7WrwD5eL1oLA2YFH2sbg==
X-Received: by 2002:ac2:5f54:0:b0:4fe:7e7f:1328 with SMTP id
 20-20020ac25f54000000b004fe7e7f1328mr3334947lfz.16.1693489439189; 
 Thu, 31 Aug 2023 06:43:59 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 d26-20020a50fb1a000000b0052574ef0da1sm798131edq.28.2023.08.31.06.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 06:43:58 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:43:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 17/20] target/riscv/cpu.c: introduce
 RISCVCPUMultiExtConfig
Message-ID: <20230831-b89b2b92f98ad55ab70bb431@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-18-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-18-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x134.google.com
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

On Thu, Aug 24, 2023 at 07:14:37PM -0300, Daniel Henrique Barboza wrote:
> If we want to make better decisions when auto-enabling extensions during
> realize() we need a way to tell if an user set an extension manually.
> The RISC-V KVM driver has its own solution via a KVMCPUConfig struct
> that has an 'user_set' flag that is set during the Property set()
> callback. The set() callback also does init() time validations based on
> the current KVM driver capabilities.
> 
> For TCG we would want a 'user_set' mechanic too, but we would look
> ad-hoc via cpu_cfg_ext_auto_update() if a certain extension was user set
> or not. If we copy what was made in the KVM side we would look for
> 'user_set' for one into 60+ extension structs spreaded in 3 arrays
> (riscv_cpu_extensions, riscv_cpu_experimental_exts,
> riscv_cpu_vendor_exts).
> 
> We'll still need an extension struct but we won't be using the
> 'user_set' flag:
> 
> - 'RISCVCPUMultiExtConfig' will be our specialized structure, similar to what
> we're already doing with the MISA extensions in 'RISCVCPUMisaExtConfig'.
> DEFINE_PROP_BOOL() for all 3 extensions arrays were replaced by
> MULTI_EXT_CFG_BOOL(), a macro that will init our specialized struct;
> 
> - the 'multi_ext_user_opts' hash will be used to store the offset of each
> extension that the user set via the set() callback, cpu_set_multi_ext_cfg().
> For now we're just initializing and populating it - next patch will use
> it to determine if a certain extension was user set;
> 
> - cpu_add_multi_ext_prop() is a new helper that will replace the
> qdev_property_add_static() calls that our macros are doing to populate
> user properties. The macro was renamed to ADD_CPU_MULTIEXT_PROPS_ARRAY()
> for clarity. Note that the non-extension properties in
> riscv_cpu_options[] still need to be declared via qdev().
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 257 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 158 insertions(+), 99 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

