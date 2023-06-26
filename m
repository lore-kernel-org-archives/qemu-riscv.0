Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9798EEB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 06:25:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDffP-0001OH-1Z; Mon, 26 Jun 2023 02:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qDffB-0001MI-Uv
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 02:25:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qDff9-0006C0-OM
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 02:25:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fa7cd95dacso36267315e9.3
 for <qemu-riscv@nongnu.org>; Sun, 25 Jun 2023 23:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687760689; x=1690352689;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4I16nClGNXeo1xcHlC0BCbMXVdeGsIW97j/CdTeGM1A=;
 b=Wz9IPZNivaIg4gi6VW/5hzotXrhoPcth9l7hVYplKxoAoS3o0w/SapcbuxFFLaffWi
 bwKMsumnNjdobZfPQySKAPUuCRZIfHYhCfsQNDjnChtWwdqz1VJ8XwWgD2Lk4CTe5nUu
 lL+Zm5sWhSDqUQmTC99qYrN1p34frgDORx/jrmvdJHo9uaMQeG+32BAl86lIIWg1YF0+
 YjksKJTjiEKQ1+Wuy73+MS5fmZjkRnZq7zq34r8hiD5THi1vsI0TPYNRPXD3Bp6PziK1
 vRrjQI3iHCSz/cDOmUiWPYuKR6fqC6MrzvAYA9/uWojiAKDpamFdywpYmZuA1H6ZPO8E
 L7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687760689; x=1690352689;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4I16nClGNXeo1xcHlC0BCbMXVdeGsIW97j/CdTeGM1A=;
 b=B047NbcXQHJEQoFZvVmGVLfxjpU80G87bFmVhsxqy0aF0GDZ4XSnTGqNQAKMqTfrOT
 Vi3B/+Re6EJ3n6bDiUscbcNQZGzp6/vKVhf+GMhxnfPbzMjyuav6EUcFhmRCr90hY+DT
 DyyiICxe788AAIBshElQ4l3/YXy+CExX35RD+7UFnAysNU43jj7dK5JB/OU5UX38DOQl
 Vk38yjdXdBZC7VkRax62+jLU9s5Y+/HFyx4qZV19o6GzlrQx6jM3TZHuBa4BsSNixq8M
 rfLoxQwNabi/G4c794Raf3LzTXkXpXk8KcLZximM3GilmNO6z0ME7WqcHwGKIXh2TRbg
 sqOQ==
X-Gm-Message-State: AC+VfDzkJBmmxp5KtSFKExIp4glTRsDenITuDtv9aoAxioULpkflAiWd
 7PY61VFOXBw9oXydStKpOUIxSg==
X-Google-Smtp-Source: ACHHUZ48k1d/67M153307x9+3Wt+OYnopFIv086dk9YYYbEU2xkKCJDTX6BgwP0mnmdioO2Uj93l9g==
X-Received: by 2002:a05:600c:2182:b0:3fa:79af:15c8 with SMTP id
 e2-20020a05600c218200b003fa79af15c8mr7000661wme.23.1687760688972; 
 Sun, 25 Jun 2023 23:24:48 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfff8e000000b003112dbc3257sm6180715wrr.90.2023.06.25.23.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 23:24:48 -0700 (PDT)
Date: Mon, 26 Jun 2023 08:24:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v3 12/19] target/riscv: add KVM specific MISA properties
Message-ID: <20230626-b5e6933676608436b6558fc4@orel>
References: <20230622135700.105383-1-dbarboza@ventanamicro.com>
 <20230622135700.105383-13-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622135700.105383-13-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jun 22, 2023 at 10:56:53AM -0300, Daniel Henrique Barboza wrote:
> Using all TCG user properties in KVM is tricky. First because KVM
> supports only a small subset of what TCG provides, so most of the
> cpu->cfg flags do nothing for KVM.
> 
> Second, and more important, we don't have a way of telling if any given
> value is an user input or not. For TCG this has a small impact since we
> just validating everything and error out if needed. But for KVM it would
> be good to know if a given value was set by the user or if it's a value
> already provided by KVM. Otherwise we don't know how to handle failed
> kvm_set_one_regs() when writing the configurations back.
> 
> These characteristics make it overly complicated to use the same user
> facing flags for both KVM and TCG. A simpler approach is to create KVM
> specific properties that have specialized logic, forking KVM and TCG use
> cases for those cases only. Fully separating KVM/TCG properties is
> unneeded at this point - in fact we want the user experience to be as
> equal as possible, regardless of the acceleration chosen.
> 
> We'll start this fork with the MISA properties, adding the MISA bits
> that the KVM driver currently supports. A new KVMCPUConfig type is
> introduced. It'll hold general information about an extension. For MISA
> extensions we're going to use the newly created misa_ext_infos[] to
> populate their name and description. 'offset' holds the MISA bit (RVA,
> RVC, ...). We're calling it 'offset' instead of 'misa_bit' because this
> same KVMCPUConfig struct will be used to multi-letter extensions later
> on.
> 
> This new type also holds a 'user_set' flag. This flag will be set when
> the user set an option that's different than what is already configured
> in the host, requiring KVM intervention to write the regs back during
> kvm_arch_init_vcpu(). Similar mechanics will be implemented for
> multi-letter extensions as well.
> 
> There is no need to duplicate more code than necessary, so we're going
> to use the existing kvm_riscv_init_user_properties() to add the KVM
> specific properties. Any code that is adding a TCG user prop is then
> changed slightly to verify first if there's a KVM prop with the same
> name already added.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 10 ++++++
>  target/riscv/kvm.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

