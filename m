Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEEBC001DB
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:29:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVXdT-0001hj-TL; Mon, 14 Aug 2023 09:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVXdR-0001fv-P6
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 09:29:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVXdO-0000UP-Qq
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 09:29:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe490c05c9so30617005e9.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 06:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692019765; x=1692624565;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mt9y7d/K95lD/GQk/+RvwZnTVmJmHzr4su96mZIWqzI=;
 b=kZP2GEiKSxGc6KudLvdGPYnUzzTf3J311QeoLRQQiubrUUcY8DpW7mI2jCY1n592SO
 8V4khnW/K5bxqS4CqmOAHqKqFd4fKs4lCmf2+2VGHMEY5vDJ1Pel6RBR1aINoS/zaDGp
 AVc59TQO8NUtJd3WjIhbJhG71F4nLE88lWyAbKJhdXuk5KF4HO7gm5LgiuXwJ8Cgjm8J
 ZnSkWkhRmw1knXBl/UvAORY+ur0MyToqp4zjcooi+9tFQHMYv85HIUJ3/82BFlWS7gAB
 2FjRDz/GnW1MKiV9Fi2UUm8DAO9+wNoeTYm4OsKr3criuqbSqJcAbDJVP5bKTgKtGsfH
 RO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692019765; x=1692624565;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mt9y7d/K95lD/GQk/+RvwZnTVmJmHzr4su96mZIWqzI=;
 b=QeDjBQERNHOZ0qlUJP35Fc98vO3a5c0wQzV4Srf9fGRUUmYdcRE+Rh5LQJT+kWxgBH
 Q3tVcu9WJ5eKFjYYO3dAj9L/OBKP/jXm0OKfcCaGDR9OTwAIqMcZfkF7ihckHMt7pbNA
 ISZRoNztGE4KCq2ENvdtCjDCxolIE+gGVrftYUOwdXfHBhdFwc3zmwMbHrQqfv3ix/SQ
 VeLPd3hlUGEcsUeoviF5XNqZF/czQGjjfyeJyZFGopgcitthptFbMi0uBiaNiM2UBe4u
 EZ3VkHduelJdG4XVZOfzRQgR4cPc7GH9/WVx755iW3rt8ex1PU6z++63/L+v9gyk9U4p
 MeYg==
X-Gm-Message-State: AOJu0Yxjp0YbwT/wv0cxJJjdnLHUaOyJUVCF3cGlQHdwcOY6RqduEUWL
 8VixZLTC7thH9QpEyjAqlYjKSw==
X-Google-Smtp-Source: AGHT+IE8RLTUT7fxK2yssmfuQKsBM0sCEMPclrJvpbLeD7w1YB3OMXjPXbLee5hGwToqAL+RR5Dc6g==
X-Received: by 2002:adf:f691:0:b0:317:5d76:1d1a with SMTP id
 v17-20020adff691000000b003175d761d1amr7528950wrp.8.1692019765015; 
 Mon, 14 Aug 2023 06:29:25 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a5d6dc2000000b00317f70240afsm14426724wrz.27.2023.08.14.06.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 06:29:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08F5B1FFBB;
 Mon, 14 Aug 2023 14:29:24 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-13-akihiko.odaki@daynix.com>
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
Subject: Re: [RFC PATCH 12/24] gdbstub: Simplify XML lookup
Date: Mon, 14 Aug 2023 14:27:08 +0100
In-reply-to: <20230731084354.115015-13-akihiko.odaki@daynix.com>
Message-ID: <87jztxrbv0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

> Now we know all instances of GDBFeature that is used in CPU so we can
> traverse them to find XML. This removes the need for a CPU-specific
> lookup function for dynamic XMLs.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  gdbstub/gdbstub.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 182efe7e0f..e5bb2c89ba 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -354,8 +354,7 @@ static const char *get_feature_xml(const char *p, con=
st char **newp,
>                                     GDBProcess *process)
>  {
>      size_t len;
> -    int i;
> -    const char *name;
> +    GDBRegisterState *r;
>      CPUState *cpu =3D gdb_get_first_cpu_in_process(process);
>      CPUClass *cc =3D CPU_GET_CLASS(cpu);
>=20=20
> @@ -364,15 +363,12 @@ static const char *get_feature_xml(const char *p, c=
onst char **newp,
>          len++;
>      *newp =3D p + len;
>=20=20
> -    name =3D NULL;
>      if (strncmp(p, "target.xml", len) =3D=3D 0) {
>          char *buf =3D process->target_xml;
>          const size_t buf_sz =3D sizeof(process->target_xml);
>=20=20
>          /* Generate the XML description for this CPU.  */
>          if (!buf[0]) {
> -            GDBRegisterState *r;
> -
>              pstrcat(buf, buf_sz,
>                      "<?xml version=3D\"1.0\"?>"
>                      "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
> @@ -389,28 +385,22 @@ static const char *get_feature_xml(const char *p, c=
onst char **newp,
>              pstrcat(buf, buf_sz, "\"/>");
>              for (r =3D cpu->gdb_regs; r; r =3D r->next) {
>                  pstrcat(buf, buf_sz, "<xi:include href=3D\"");
> -                pstrcat(buf, buf_sz, r->feature->xml);
> +                pstrcat(buf, buf_sz, r->feature->xmlname);
>                  pstrcat(buf, buf_sz, "\"/>");
>              }
>              pstrcat(buf, buf_sz, "</target>");
>          }
>          return buf;
>      }

It would be nice to modernise this code before adding to it. The static
target_xml buffer and use of pstrcat could be replaced by GString code
that is less sketchy.


> -    if (cc->gdb_get_dynamic_xml) {
> -        char *xmlname =3D g_strndup(p, len);
> -        const char *xml =3D cc->gdb_get_dynamic_xml(cpu, xmlname);
> -
> -        g_free(xmlname);
> -        if (xml) {
> -            return xml;
> -        }
> +    if (strncmp(p, cc->gdb_core_feature->xmlname, len) =3D=3D 0) {
> +        return cc->gdb_core_feature->xml;
>      }
> -    for (i =3D 0; ; i++) {
> -        name =3D gdb_features[i].xmlname;
> -        if (!name || (strncmp(name, p, len) =3D=3D 0 && strlen(name) =3D=
=3D len))
> -            break;
> +    for (r =3D cpu->gdb_regs; r; r =3D r->next) {
> +        if (strncmp(p, r->feature->xmlname, len) =3D=3D 0) {
> +            return r->feature->xml;
> +        }
>      }
> -    return name ? gdb_features[i].xml : NULL;
> +    return NULL;
>  }
>=20=20
>  const GDBFeature *gdb_find_static_feature(const char *xmlname)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

