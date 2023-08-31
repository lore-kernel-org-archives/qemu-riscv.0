Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FC7C83F32
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:16:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhWt-0005Oj-Bb; Thu, 31 Aug 2023 09:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhWr-0005Mg-7y
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:16:09 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhWn-0003cG-KT
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:16:08 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52a4b62c2f5so997215a12.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693487764; x=1694092564; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WGnbmpvXd9Mx77ztVvlz0ONUxaQhQMpn3R0jYR5bsgQ=;
 b=hHUOwfOpRMsd00jQoSn7uOrFVFAb7s9ZupzCqO0xKXTwXYLtPoCfjHOLC4F5oqYJAT
 4TcD6WkKZPi4oYYNGGSiMH+tyDMtAHxMgtNjYjcYokZDh6CFcw9aw0i7NV1dN8qyV2qT
 uCT5A0y6p9mDqvb0sAhl6jUhVgwOK1SEn+kXrQTYgRddJA3Spkzyy/dPqnFcHt9SZgvJ
 sDpE9CjLVF+uKQzRXoR5mE+jqWRy9IkG+pMBCGtnQVf6L8kqhFUPcuCD+qJkluDSxftE
 H1Xn5So4boS9x4wsyUsdZkx3wY92L3Dm18IBJ8tXwW3xxoDl4fYvqIGtaqJ1wKXXQzXu
 2/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693487764; x=1694092564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGnbmpvXd9Mx77ztVvlz0ONUxaQhQMpn3R0jYR5bsgQ=;
 b=MMzAbItf/kv+tbMqWcHB7rxfpNjDNT9624/AyfXCNuSfPiuDFqG9+CMliSB9/T1uqG
 kgOvyd+Zkmrl2uMjsL+hgrBmNH4HDWXkHHl6lpmjfiNy+1aRxpKNY20c44lVhh07VvQr
 nue11j4XavZbp5IbzH5OfH9QabIXRCLTDW9+xK8pCOerR5KtlhslBkJpLmpxRTJuTAqH
 FQAsH+//N4egBGCxc6Qj9kL/ZpdXiTAk6Kr+Gp2QROm0gj17u4pgq7vPhz/U7MFZMOm4
 5igHW8j9hFZ7VugMOdwPoxlz+7A8vgxwZu8RF3QAnVNJKZif9HC+TOK7/Ciyj2uiAxNd
 WxDQ==
X-Gm-Message-State: AOJu0YxSL5yPI7ZE8GhIAL+itiPFoI7KONTi7FlmqX3lnh76mQUy6yyp
 Uist1IdDrC6ascEHbfjA15Wmbg==
X-Google-Smtp-Source: AGHT+IHEcC0uuQOiGuf7uedPOtHxKczLNjSkcwZOg+wqDvYbEYZNdfw8rd6dHHtC2/LCpBRphFWHAQ==
X-Received: by 2002:a17:906:5a70:b0:9a5:acf7:cff1 with SMTP id
 my48-20020a1709065a7000b009a5acf7cff1mr3584701ejc.57.1693487763760; 
 Thu, 31 Aug 2023 06:16:03 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a1709060f5500b009a1be9c29d7sm752188ejj.179.2023.08.31.06.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 06:16:03 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:16:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 11/20] avocado, risc-v: add opensbi tests for
 'max' CPU
Message-ID: <20230831-1c9bd710f47d8bd9eeeb46c8@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-12-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-12-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Aug 24, 2023 at 07:14:31PM -0300, Daniel Henrique Barboza wrote:
> Add smoke tests to ensure that we'll not break the 'max' CPU type when
> adding new ratified extensions to be enabled.

I'm not really sure what this test proves other than we didn't remove the
minimally supported set of extensions that opensbi requires to boot. The
other opensbi tests appear to be ensuring boards can boot, rather than
cpus.

Thanks,
drew

> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  tests/avocado/riscv_opensbi.py | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
> index bfff9cc3c3..15fd57fe51 100644
> --- a/tests/avocado/riscv_opensbi.py
> +++ b/tests/avocado/riscv_opensbi.py
> @@ -61,3 +61,19 @@ def test_riscv64_virt(self):
>          :avocado: tags=machine:virt
>          """
>          self.boot_opensbi()
> +
> +    def test_riscv32_virt_maxcpu(self):
> +        """
> +        :avocado: tags=arch:riscv32
> +        :avocado: tags=machine:virt
> +        :avocado: tags=cpu:max
> +        """
> +        self.boot_opensbi()
> +
> +    def test_riscv64_virt_maxcpu(self):
> +        """
> +        :avocado: tags=arch:riscv64
> +        :avocado: tags=machine:virt
> +        :avocado: tags=cpu:max
> +        """
> +        self.boot_opensbi()
> -- 
> 2.41.0
> 
> 

