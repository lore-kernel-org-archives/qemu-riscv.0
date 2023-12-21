Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CBDC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:20:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGIxq-0004Nx-Fn; Thu, 21 Dec 2023 08:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rGIxh-0004Ip-40
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 08:19:41 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rGIxd-0004Ux-AK
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 08:19:40 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-593f6fb21a5so550029eaf.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 05:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1703164776; x=1703769576;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xwacrzLBpA+7qNqKLKW6P7iJRvrUEffyGirc6Z5p94U=;
 b=y6HwN4tRpBIvubX2S6Tkmd63nsodN9Xhqhw9iBNizA99s25qs/X7nq9aBlGGUwxauZ
 pL4aHkzT4B3xrofW2EAeXQPX/RK+pZkc+S6/1hTzwaDMjn+Eii/2Xt8XA0AFRNdP1BWk
 bAY/gkvX5dXQWhSUZlJVC1Nb4AvfO68kH6c43ANTwRS02uhFJU3MR+CCd0t3eHFxbVN4
 knuYd1Ow1YcLFT6Y8QrhOtCUA88pcacU5/eHJEiGWILzQOnyGLp1XEKKvEse6TRhbAGO
 HyOjtkwTQbRtDuK9ZRrIsH4LKQO2r0d4VhssTzHPImUJKiwixqWXKEIwR0FtmBNxRQGi
 vdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703164776; x=1703769576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xwacrzLBpA+7qNqKLKW6P7iJRvrUEffyGirc6Z5p94U=;
 b=PBG0+QkYVjkBaZ31m6YqhB+H2DQi5P/Ux+Fdg6R0g+YiQ0wVGrWwNPWkx82OjGLrc5
 tRSKhmd8tcz69nau29aRcwPyj+T0/gxrTK7WpYU/DazO0J3tit9a3WDpD0vyx5UVVHtn
 bBJPOWkWwnaEaOfsYNCU3CHANdvvphb8Qqk+0/vsWaIkWKvPheMX4friStVqVw5mHpNc
 Fq/LIpOBy5kLdZ6KfTSQOkNphQnLtJxaboS/fZFIL/hG+IbwPEiq36+VaE3XbG9VGmoa
 9Lq2DR4Eh1WuCfcznS+HQdC5m/H/MbXHU5XKLGGG/9zwGewE6d2rZlod9lZw28w5dLiN
 WD2Q==
X-Gm-Message-State: AOJu0YyksQI0gXTD/OBnjKCGu4OqUoRGvEk/WYUmr+Vh4nEOYBuR8gQD
 up6ihrw8Tgge2kWzwBggAe/iNA==
X-Google-Smtp-Source: AGHT+IGxbsSZ9PeiiKJkEVFCCUo7LUzl75tIosPOKCu5gnxWVDQqzciwl8Jbemw6CO0IZlVeMEgpvA==
X-Received: by 2002:a05:6358:7e14:b0:172:bab8:8a51 with SMTP id
 o20-20020a0563587e1400b00172bab88a51mr1217478rwm.65.1703164775932; 
 Thu, 21 Dec 2023 05:19:35 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932?
 ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a63d753000000b005cd78f13608sm1556327pgi.13.2023.12.21.05.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 05:19:35 -0800 (PST)
Message-ID: <a26a55b2-240c-48c3-b341-48c1d7195bd9@daynix.com>
Date: Thu, 21 Dec 2023 22:19:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/40] plugins: add an API to read registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Paul Durrant <paul@xen.org>,
 qemu-s390x@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Bin Meng <bin.meng@windriver.com>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
 <20231221103818.1633766-38-alex.bennee@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231221103818.1633766-38-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::c32;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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

On 2023/12/21 19:38, Alex Bennée wrote:
> We can only request a list of registers once the vCPU has been
> initialised so the user needs to use either call the get function on
> vCPU initialisation or during the translation phase.
> 
> We don't expose the reg number to the plugin instead hiding it behind
> an opaque handle. This allows for a bit of future proofing should the
> internals need to be changed while also being hashed against the
> CPUClass so we can handle different register sets per-vCPU in
> hetrogenous situations.
> 
> Having an internal state within the plugins also allows us to expand
> the interface in future (for example providing callbacks on register
> change if the translator can track changes).
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - use new get whole list api, and expose upwards
> 
> vAJB:
> 
> The main difference to Akikio's version is hiding the gdb register
> detail from the plugin for the reasons described above.
> ---
>   include/qemu/qemu-plugin.h   |  53 +++++++++++++++++-
>   plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>   plugins/qemu-plugins.symbols |   2 +
>   3 files changed, 155 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 4daab6efd29..e3b35c6ee81 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -11,6 +11,7 @@
>   #ifndef QEMU_QEMU_PLUGIN_H
>   #define QEMU_QEMU_PLUGIN_H
>   
> +#include <glib.h>
>   #include <inttypes.h>
>   #include <stdbool.h>
>   #include <stddef.h>
> @@ -227,8 +228,8 @@ struct qemu_plugin_insn;
>    * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
>    * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
>    *
> - * Note: currently unused, plugins cannot read or change system
> - * register state.
> + * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot change
> + * system register state.
>    */
>   enum qemu_plugin_cb_flags {
>       QEMU_PLUGIN_CB_NO_REGS,
> @@ -708,4 +709,52 @@ uint64_t qemu_plugin_end_code(void);
>   QEMU_PLUGIN_API
>   uint64_t qemu_plugin_entry_code(void);
>   
> +/** struct qemu_plugin_register - Opaque handle for a translated instruction */
> +struct qemu_plugin_register;

What about identifying a register with an index in an array returned by 
qemu_plugin_get_registers(). That saves troubles having the handle 
member in qemu_plugin_reg_descriptor.

> +
> +/**
> + * typedef qemu_plugin_reg_descriptor - register descriptions
> + *
> + * @name: register name
> + * @handle: opaque handle for retrieving value with qemu_plugin_read_register
> + * @feature: optional feature descriptor, can be NULL

Why can it be NULL?

> + */
> +typedef struct {
> +    char name[32];

Why not const char *?

> +    struct qemu_plugin_register *handle;
> +    const char *feature;
> +} qemu_plugin_reg_descriptor;
> +
> +/**
> + * qemu_plugin_get_registers() - return register list for vCPU
> + * @vcpu_index: vcpu to query
> + *
> + * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
> + * frees the array (but not the const strings).
> + *
> + * As the register set of a given vCPU is only available once
> + * the vCPU is initialised if you want to monitor registers from the
> + * start you should call this from a qemu_plugin_register_vcpu_init_cb()
> + * callback.

Is this note really necessary? You won't know vcpu_index before 
qemu_plugin_register_vcpu_init_cb() anyway.

> + */
> +GArray * qemu_plugin_get_registers(unsigned int vcpu_index);

Spurious space after *.

> +
> +/**
> + * qemu_plugin_read_register() - read register
> + *
> + * @vcpu: vcpu index
> + * @handle: a @qemu_plugin_reg_handle handle
> + * @buf: A GByteArray for the data owned by the plugin
> + *
> + * This function is only available in a context that register read access is
> + * explicitly requested.
> + *
> + * Returns the size of the read register. The content of @buf is in target byte
> + * order. On failure returns -1
> + */
> +int qemu_plugin_read_register(unsigned int vcpu,
> +                              struct qemu_plugin_register *handle,
> +                              GByteArray *buf);

Indention is not correct. docs/devel/style.rst says:

 > In case of function, there are several variants:
 >
 > * 4 spaces indent from the beginning
 > * align the secondary lines just after the opening parenthesis of the 
first

