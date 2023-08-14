Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D92C001B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 15:16:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVZIO-0006Ck-9m; Mon, 14 Aug 2023 11:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVZHi-0005tU-4e
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 11:15:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVZHd-0000Pl-ME
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 11:15:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31972944f30so1267029f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692026104; x=1692630904;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCN8NA+Uoy5p+H9hDRQ5V8pY3hTD9tUcZiQ2xG7Ty80=;
 b=zjwh3VMS+gwRIIbqdMCxo7SBLj5exUl5XdP4Yq05LIEODcg4eJcwQhdztKHnlBU4UR
 3FLlPEUn3YDZq+HPY6YnGIyh/cXP0lNtfxfZ9UTdxiYTfSPdxagVaeWDLPQt/ZjH47zp
 LxRBYTmxlZevXrl7IMTf4RHhG0hc8rOIGfGgIZGgt0GLtGgqeLAkmTfiUrj8GItnVVpU
 71bfyvEtvynIU44IYZ0NBG+ynv8nFOK9FcgOGO7ZfWtonR9IXAUTm2M16GL4imIjyIsu
 1c/FvCz9kyFzQCNHko6puMjhEVpRwoWQGgdnVygXZA+nO3sLdtJIu0thiryk8XNIj6YE
 PF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692026104; x=1692630904;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bCN8NA+Uoy5p+H9hDRQ5V8pY3hTD9tUcZiQ2xG7Ty80=;
 b=k7Hgwk2UTBeoeQnO8TsUP30F2i8VA9x4QsNY+bbrwuOVBunQfaWtBBS4AxfJdVitwS
 jKIjIB9FRE/FnT5m/SmHcjuRBrgRNASG+LlzTmhxa4wo3jH3t9kfUbULfbv6H6ymiHIa
 ZY9WT1I05lX3GjjKffFqwCqYWC4wRoNUBb2idrBvYOGZgt9k1rO6lTSEgJUhtFeaRiZ3
 f2D0oYb1Z22pgLA/kyt3WDuV2tVrbsxS2PYuSHoBOd8k0PE4rABa4NEikfRREq/h5019
 9iN/AB8w7GV42YhQvn9/0Kh2h4Vu+pqU/3h0cGsUa9At5Rof1LqXgstyX7RY56YSzGVo
 an3g==
X-Gm-Message-State: AOJu0YykW4ZrKszREVePz5ZJC3xF9XO0c8VZc+WvzrxvFg5s9ZsL3oXP
 TZwloqpTtZ2DRlQB4hg+hJpM8g==
X-Google-Smtp-Source: AGHT+IEeBUi/NHrK5K7RBlCJ9nwEIyIbPV+T97q4hGidMS3lDd5USjkzT6GzRiYGiDbKiEBQspPJGA==
X-Received: by 2002:adf:ed8f:0:b0:317:60f2:c08b with SMTP id
 c15-20020adfed8f000000b0031760f2c08bmr7849484wro.31.1692026103714; 
 Mon, 14 Aug 2023 08:15:03 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a1cf716000000b003fe23b10fdfsm17785682wmh.36.2023.08.14.08.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 08:15:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE78B1FFBB;
 Mon, 14 Aug 2023 16:15:02 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-22-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, Aurelien
 Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Chris Wulff
 <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Nicholas Piggin
 <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [RFC PATCH 21/24] plugins: Allow to read registers
Date: Mon, 14 Aug 2023 16:05:16 +0100
In-reply-to: <20230731084354.115015-22-akihiko.odaki@daynix.com>
Message-ID: <87y1idpseh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> It is based on GDB protocol to ensure interface stability.

See comments bellow.

> The timing of the vcpu init hook is also changed so that the hook will
> get called after GDB features are initialized.

This might be worth splitting to a separate patch for cleaner bisecting.

>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  include/qemu/qemu-plugin.h   | 65 ++++++++++++++++++++++++++++++++++--
>  cpu.c                        | 11 ------
>  hw/core/cpu-common.c         | 10 ++++++
>  plugins/api.c                | 40 ++++++++++++++++++++++
>  plugins/qemu-plugins.symbols |  2 ++
>  5 files changed, 114 insertions(+), 14 deletions(-)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 50a9957279..214b12bfd6 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -11,6 +11,7 @@
>  #ifndef QEMU_QEMU_PLUGIN_H
>  #define QEMU_QEMU_PLUGIN_H
>=20=20
> +#include <glib.h>
>  #include <inttypes.h>
>  #include <stdbool.h>
>  #include <stddef.h>
> @@ -51,7 +52,7 @@ typedef uint64_t qemu_plugin_id_t;
>=20=20
>  extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
>=20=20
> -#define QEMU_PLUGIN_VERSION 1
> +#define QEMU_PLUGIN_VERSION 2
>=20=20
>  /**
>   * struct qemu_info_t - system information for plugins
> @@ -218,8 +219,8 @@ struct qemu_plugin_insn;
>   * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
>   * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
>   *
> - * Note: currently unused, plugins cannot read or change system
> - * register state.
> + * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot chan=
ge
> + * system register state.
>   */
>  enum qemu_plugin_cb_flags {
>      QEMU_PLUGIN_CB_NO_REGS,
> @@ -664,4 +665,62 @@ uint64_t qemu_plugin_end_code(void);
>   */
>  uint64_t qemu_plugin_entry_code(void);
>=20=20
> +/**
> + * struct qemu_plugin_register_file_t - register information
> + *
> + * This structure identifies registers. The identifiers included in this
> + * structure are identical with names used in GDB's standard target feat=
ures
> + * with some extensions. For details, see:
> + *
> https://sourceware.org/gdb/onlinedocs/gdb/Standard-Target-Features.html

I'm not super keen on baking GDB-isms into the plugin register
interface.

> + *
> + * A register is uniquely identified with the combination of a feature n=
ame
> + * and a register name or a register number. It is recommended to derive
> + * register numbers from feature names and register names each time a ne=
w vcpu
> + * starts.

Do you have examples of clashing register names from different feature
sets?=20

> + *
> + * To derive the register number from a feature name and a register name,
> + * first look up qemu_plugin_register_file_t with the feature name, and =
then
> + * look up the register name in its @regs. The sum of the @base_reg and =
the
> + * index in the @reg is the register number.
> + *
> + * Note that @regs may have holes; some elements of @regs may be NULL.
> + */
> +typedef struct qemu_plugin_register_file_t {
> +    /** @name: feature name */
> +    const char *name;
> +    /** @regs: register names */
> +    const char * const *regs;
> +    /** @base_reg: the base identified number */
> +    int base_reg;
> +    /** @num_regs: the number of elements in @regs */
> +    int num_regs;
> +} qemu_plugin_register_file_t;
> +
> +/**
> + * qemu_plugin_get_register_files() - returns register information
> + *
> + * @vcpu_index: the index of the vcpu context
> + * @size: the pointer to the variable to hold the number of returned ele=
ments
> + *
> + * Returns an array of qemu_plugin_register_file_t. The user should g_fr=
ee()
> + * the array once no longer needed.
> + */
> +qemu_plugin_register_file_t *
> +qemu_plugin_get_register_files(unsigned int vcpu_index, int *size);

I think I'd rather have a simpler interface that returns an anonymous
handle to the plugin. For example:

  struct qemu_plugin_register;
  struct qemu_plugin_register qemu_plugin_find_register(const char *name);

> +
> +/**
> + * qemu_plugin_read_register() - read register
> + *
> + * @buf: the byte array to append the read register content to.
> + * @reg: the register identifier determined with
> + *       qemu_plugin_get_register_files().
> + *
> + * This function is only available in a context that register read acces=
s is
> + * explicitly requested.
> + *
> + * Returns the size of the read register. The content of @buf is in targ=
et byte
> + * order.
> + */
> +int qemu_plugin_read_register(GByteArray *buf, int reg);

and this then becomes:

  int qemu_plugin_read_register(GByteArray *buf, struct qemu_plugin_registe=
r);

in practice these can become anonymous pointers which hide the
implementation details from the plugin itself. Then the details of
mapping the register to a gdb regnum can be kept in the plugin code
keeping us free to further re-factor the code as we go.

The plugin code works quite hard to try and avoid leaking implementation
details to plugins so as not to tie QEMU's hands in re-factoring. While
the interface provided is technically GDB's, not QEMUs I don't think its
a particularly nice one to expose.

<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

