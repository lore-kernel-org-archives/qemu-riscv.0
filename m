Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CF6C4332F
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Nov 2023 12:41:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzcQZ-0007B6-9q; Sun, 05 Nov 2023 07:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qzcQX-0007AF-DD
 for qemu-riscv@nongnu.org; Sun, 05 Nov 2023 07:40:30 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qzcQR-0004eJ-6p
 for qemu-riscv@nongnu.org; Sun, 05 Nov 2023 07:40:29 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6c32a20d5dbso2693197b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Nov 2023 04:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1699188022; x=1699792822;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vf6hD4b5DeYyR1VQm5b1bivfW1BFqsDiKGbajuDl/eI=;
 b=al7MPwgJgvZMMByPCJvNnkwQjV+9ImkL6VCeUOk/p2YSfXu9gGF52ZTymrNJEdpaVK
 eUhQy/VWmW3Mz+06bWphMyjpXl5oZxxcf2XgvLBG2xS4vM8IAE+PWLBYLc6iWT3nsZBF
 yoYeU7hu84LTuv55uRn6TFs/XfZDjrhwIO1fWn+ej8oEAGSX8EKGSxZfDP13YqeCWtuy
 vIncFp4ervHtNyvYTHHqPSVa3aZSStP+CJ9mP7s5lT75W1gZvs1MabLX3QVLVK9XmPQT
 DX5g0xqSXbsvIhp/V9+uRhVn4OgY0SgBKIB8LykdmW4+VgSU25lsDC/y4v/IzygJtsGw
 RJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699188022; x=1699792822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vf6hD4b5DeYyR1VQm5b1bivfW1BFqsDiKGbajuDl/eI=;
 b=Yd/6ywWVVAQT3tuMGyj/e5I1dtK0/f1Zv569+D7gJsDsYb7M9gJJTrtgCET++W7kqj
 Ies+QLG6R4+L5XPF4aRjvMGlys3MqEx9pxC/n13i0F2xsr+hZ917oKro8lGOLalPtyoo
 KLLdfqiZ8sKXZLSgTzemfR8H3M603Z2xgp6+JvWhVAaljSVAmdvFNA46myZrhHZCnkD2
 YlV9TVLy3mcOLwYolPvetdL7VD3ki9Q+6/grbO/n4bW6ib1H074orldMD4C6dsV8C3YY
 82Vc7fV4/DWXHDeNS6cxOTVuAgmTpBUf8CLKCYoZhH0rPYtseHMpxRh1y1XlKS10RdXZ
 OFbg==
X-Gm-Message-State: AOJu0Yx/8rDrSEKSJSKdaDv/tX909D3aLZw4ITLO73lw8CqhJfnO8r3+
 BuvM2IyDFrikXRM8BJjyM+XCCQ==
X-Google-Smtp-Source: AGHT+IEi0KXGbZSe7qwgF+DFcSd7hs7HKWUtrLO8aYPCk34nFrOvK5drPh0J5mkKUj9JCs46tRY81A==
X-Received: by 2002:a05:6a20:914e:b0:16b:b824:b25c with SMTP id
 x14-20020a056a20914e00b0016bb824b25cmr22441456pzc.25.1699188021599; 
 Sun, 05 Nov 2023 04:40:21 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a170902d2c100b001c625acfed0sm4160870plc.44.2023.11.05.04.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 04:40:20 -0800 (PST)
Message-ID: <e9c6bb21-678e-44d5-b34d-e7a840a1b7b0@daynix.com>
Date: Sun, 5 Nov 2023 21:40:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/29] plugins: add an API to read registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Brian Cain <bcain@quicinc.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
 <20231103195956.1998255-25-alex.bennee@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231103195956.1998255-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
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

On 2023/11/04 4:59, Alex Bennée wrote:
> We can only request a list of registers once the vCPU has been
> initialised so the user needs to use either call the find function on
> vCPU initialisation or during the translation phase. We don't expose
> the reg number to the plugin instead hiding it behind an opaque
> handle. This allows for a bit of future proofing should the internals
> need to be changed while also being hashed against the CPUClass so we
> can handle different register sets per-vCPU in hetrogenous situations.
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
> vAJB:
> 
> The main difference to Akikio's version is hiding the gdb register
> detail from the plugin for the reasons described above.
> ---
>   include/qemu/qemu-plugin.h   |  52 +++++++++++++++++-
>   plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>   plugins/qemu-plugins.symbols |   2 +
>   3 files changed, 154 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 50a9957279..e5c16df5ca 100644
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
> @@ -218,8 +219,8 @@ struct qemu_plugin_insn;
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
> @@ -664,4 +665,51 @@ uint64_t qemu_plugin_end_code(void);
>    */
>   uint64_t qemu_plugin_entry_code(void);
>   
> +/** struct qemu_plugin_register - Opaque handle for a translated instruction */
> +struct qemu_plugin_register;
> +
> +/**
> + * typedef qemu_plugin_reg_descriptor - register descriptions
> + *
> + * @name: register name
> + * @handle: opaque handle for retrieving value with qemu_plugin_read_register
> + * @feature: optional feature descriptor, can be NULL
> + */
> +typedef struct {
> +    char name[32];
> +    struct qemu_plugin_register *handle;
> +    const char *feature;
> +} qemu_plugin_reg_descriptor;
> +
> +/**
> + * qemu_plugin_find_registers() - return register list
> + * @vcpu_index: vcpu to query
> + * @reg_pattern: register name pattern
> + *
> + * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
> + * frees. As the register set of a given vCPU is only available once
> + * the vCPU is initialised if you want to monitor registers from the
> + * start you should call this from a qemu_plugin_register_vcpu_init_cb()
> + * callback.
> + */
> +GArray * qemu_plugin_find_registers(unsigned int vcpu_index, const char *reg_pattern);

A pattern may be convenient for humans but not for machine. My 
motivation to introduce the feature is to generate traces consumable by 
trace-based simulators. Such a plugin needs an exact match of registers.

