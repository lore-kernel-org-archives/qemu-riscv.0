Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73940C25B78
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 May 2024 15:42:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sBcUe-0005KC-7s; Mon, 27 May 2024 11:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sBcUd-0005Bz-7S
 for qemu-riscv@nongnu.org; Mon, 27 May 2024 11:42:35 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sBcUX-0004ou-J3
 for qemu-riscv@nongnu.org; Mon, 27 May 2024 11:42:34 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e9819a630fso10062091fa.1
 for <qemu-riscv@nongnu.org>; Mon, 27 May 2024 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716824538; x=1717429338; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xtjjVrFaJTF2X6JKfJWm8s6KMTtbMjWj+Xib+7eKbLk=;
 b=jD+z/EP5Hb5OFMeAIGYVpX7RGgdy7buFAXnF2kbmhOCZZ6qeCVOx6067DcbHVIBS9L
 Yal4wePlnyttuq2dD5dQ2WmwlFVqncMJupwNQODsv55weIlZlIw4APRmojS/XJLurDbi
 LkmESxg0mifbMLacWYUN0j7hko9lBVce2rV8SueETKQhPMRjQN1cnG5FqAjLpolPKks9
 mNX5YnyTtey5pyfgZ79xK4LsOTzZo604mrCIYa/qAA70m0yCvwLH8DkrVvo56pXc9AAz
 ycO6JuXwFZPFzGBq5ShVuAR6Xg0Ien126kKXT90fZskfn2NNDYb5e+aGZhf54HjzpSHI
 +LFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716824538; x=1717429338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtjjVrFaJTF2X6JKfJWm8s6KMTtbMjWj+Xib+7eKbLk=;
 b=GlZU6Q/zREcT5PnUhkow9vWbHSl9lFqGufcJ9tUD6/heMrOaXNReFxW5u+K7LxXDcY
 oi0JYG0Ky03rtrBDgRdo5A9ZD5nHtPUzfRBnAcCBojbQ1AJJR9Nm3CKxfXWu+2pbAHJx
 HaROUjG/6NcmmYP0IERCgKEJPEQMm4a/viz5fokVk1Ek62tF9Jd4HWJeOxolsHwM2RzO
 OGqIvQ7L6ob2wN7U7PrTI8JMaKQ7hwua1jNWOG9cvMO5aJgGLfpZGMBp9OU1qPalHLlk
 jB27bb5xcQ2xwG0xh9r8U7ZWsHHiXnLcdBQjhQUPTcDTwblnYTc/rlFDpiNsvKtZpPOj
 seGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0msMTYXM/V7XMGbSzomuTUo4gEiFafGJws4aPOOiDF94DTJm4lZ3/HvN0r+Pj13sPgwtVD72ka+pepU9ystF0Bl/Y+a4=
X-Gm-Message-State: AOJu0YyCTponunncLuEkc33vTLu+p+txw3FYpy+mDwCaMcFEyVgd3cWS
 U4hRUE+4LHd5CDnA3BFCPrdtpJo8EQ0CvG7QPTvtK2fm0ob353gI+v7T3KjdY7o58WEEFRrHXZ/
 kkT8=
X-Google-Smtp-Source: AGHT+IE1n/X+TNgvqyvPEBBGQPzAFsemjne/fBOg4XMqyQm0v3lcflJXEGM0LQeztVfsguCMS7RlJA==
X-Received: by 2002:a2e:2404:0:b0:2e2:812:4c4 with SMTP id
 38308e7fff4ca-2e95b0c2359mr71352901fa.29.1716824538089; 
 Mon, 27 May 2024 08:42:18 -0700 (PDT)
Received: from localhost ([176.74.158.132]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6286457089sm410548266b.64.2024.05.27.08.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 08:42:17 -0700 (PDT)
Date: Mon, 27 May 2024 17:42:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Chao Du <duchao@eswincomputing.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 alistair23@gmail.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, 
 anup@brainfault.org, duchao713@qq.com
Subject: Re: [PATCH v1 2/4] target/riscv/kvm: implement
 kvm_arch_update_guest_debug()
Message-ID: <20240527-29c3e75b26b24a71b4926950@orel>
References: <20240527021916.12953-1-duchao@eswincomputing.com>
 <20240527021916.12953-3-duchao@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527021916.12953-3-duchao@eswincomputing.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x22d.google.com
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

On Mon, May 27, 2024 at 02:19:14AM GMT, Chao Du wrote:
> Set the control flag when there are active breakpoints. This will
> help KVM to know the status in the userspace.
> 
> Signed-off-by: Chao Du <duchao@eswincomputing.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index cba55c552d..0bc3348b91 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -2039,5 +2039,7 @@ void kvm_arch_remove_all_hw_breakpoints(void)
>  
>  void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *dbg)
>  {
> -    /* TODO; To be implemented later. */
> +    if (kvm_sw_breakpoints_active(cs)) {
> +        dbg->control |= KVM_GUESTDBG_ENABLE;
> +    }
>  }
> -- 
> 2.17.1
> 
>

Should squash this into the previous patch.

Thanks,
drew

