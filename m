Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BF6C001DE
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 17:41:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMu89-0008Ev-D9; Fri, 21 Jul 2023 13:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qMu84-0008EQ-Ox
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 13:41:25 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qMu82-00010f-TK
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 13:41:24 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso18953565e9.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Jul 2023 10:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689961279; x=1690566079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oWngwrMo9tfYsDEwETiHHjHUDWaHKjCLtIZQ2VnXF7c=;
 b=aTqIdTpVZIP4IVD51tOsAm0tR92i26ku0QRdMxib75xiGv1WuDJToy9b7LZrUOyuWs
 ug3ZVQs0v1TonuQR2lcsV2mO46xdshqUBhttSnBH7Rrb3XgEEL+nF691T8oB9Z/p7g+Y
 AAMeANAszmpY1NlEbJPZwpRtpA37I27sbLny0PlZD7HmZHG8bLpB79BpLuV1ukSJVcH5
 y+gv0xZl7RRfxTHin5Ewyz2/48Hu6+QdHEbqcygrYQXw2d3QR3K0TRSxgMYbs+UmA4d7
 myGSY6a1NPABafYZVSdxPJPcTrHpkcEO6gmjUqLKlvTu7eZqPpQ7N+4AstkSKRNJTaO2
 RajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689961279; x=1690566079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWngwrMo9tfYsDEwETiHHjHUDWaHKjCLtIZQ2VnXF7c=;
 b=X47H4M4bynzmftXfO5SLBMuLI7c22dcogDVvfpBfv3BGA449Z75KFD2tiIBDsBCOhn
 pT3erH5WodeRmiuAU2uafrCBEnrJ6ulOmhc8aGxx27Gf/99o4Iw/6KJ3H552F2INSkL3
 Unm6cDMOCfqCw20k1VgEXVeYXGf2h6a6bxJ+ddRU4WnEXnjAgcqDynJ01E0GeIQdUz0c
 0PsfgyT18cjnBkcEfIaniAdbnPHkODsniDwGY0wV0EH1w2FRmT7e1KaUBcwS7P7Kx21o
 9aDCoWzGeNkQTOfo7yJDjqE0284E4ow1yNfJLETq78HdrZyGQQUPfNQff6KxZzaTDLIc
 VO3g==
X-Gm-Message-State: ABy/qLaZ2GwPuGYqokF2BVpVIeFo9cWDo7xKXRYTR7tMlBXadSHw+sQW
 rpdndbvv1BD4IebOUhCNFzaA/A==
X-Google-Smtp-Source: APBJJlG69RYuLgM+byfVXHJKxwKW8uCOZZnRcc5dSXYdEn2ESNpecR5PiRno3VUFKC9534g612t9Ug==
X-Received: by 2002:a05:600c:2102:b0:3fb:d1db:545a with SMTP id
 u2-20020a05600c210200b003fbd1db545amr1950667wml.15.1689961279465; 
 Fri, 21 Jul 2023 10:41:19 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c210900b003fbcdba1a52sm6476865wml.3.2023.07.21.10.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 10:41:18 -0700 (PDT)
Date: Fri, 21 Jul 2023 19:41:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com, 
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org, 
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Subject: Re: [PATCH v6 3/5] target/riscv: Create an KVM AIA irqchip
Message-ID: <20230721-72cb5810011b0a676b359d36@orel>
References: <20230714084429.22349-1-yongxuan.wang@sifive.com>
 <20230714084429.22349-4-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714084429.22349-4-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
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

On Fri, Jul 14, 2023 at 08:44:25AM +0000, Yong-Xuan Wang wrote:
> We create a vAIA chip by using the KVM_DEV_TYPE_RISCV_AIA and then set up
> the chip with the KVM_DEV_RISCV_AIA_GRP_* APIs.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/kvm.c       | 160 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/kvm_riscv.h |   6 ++
>  2 files changed, 166 insertions(+)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 005e054604..9bc92cedff 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -36,6 +36,7 @@
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
>  #include "hw/irq.h"
> +#include "hw/intc/riscv_imsic.h"
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "kvm_riscv.h"
> @@ -43,6 +44,7 @@
>  #include "chardev/char-fe.h"
>  #include "migration/migration.h"
>  #include "sysemu/runstate.h"
> +#include "hw/riscv/numa.h"
>  
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
>                                   uint64_t idx)
> @@ -1026,3 +1028,161 @@ bool kvm_arch_cpu_check_are_resettable(void)
>  void kvm_arch_accel_class_init(ObjectClass *oc)
>  {
>  }
> +
> +char *kvm_aia_mode_str(uint64_t aia_mode)
> +{
> +    const char *val;

I just tried compiling this series and see it doesn't with -Werror.
kvm_aia_mode_str() should return 'const char *' and this 'val' variable
is unused.

Thanks,
drew

