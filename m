Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8574CD98D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:02:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNbb-0001oy-Qr; Tue, 10 Oct 2023 21:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNbJ-0001me-Q2; Tue, 10 Oct 2023 21:01:29 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNbH-00066g-To; Tue, 10 Oct 2023 21:01:25 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7b07719089aso268749241.0; 
 Tue, 10 Oct 2023 18:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696986081; x=1697590881; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qya31W9YBJ8jOwGlDzkTtT3a4oUoppVZSkQ76dfvfI4=;
 b=h3tV2/y8zxhX5EnZnflRs9v8+sATYROk1r3SUUlffxoXH1v88xUSd1lBe3S0O4teSj
 gyCJJjA7SWRW4ub3C4kFRdJpyxTuaB3fVtFtCFHu1Nzpv2TLGZqXtVjmylORPC2iD6l8
 uGPDSXSeli6FCUsFoFQQl8zGrSQV2gqiFKe81FZodTGLGAnfjCOqIMQhHyo+Hoo7uvIf
 Q7szpFF5Ghr7jJ8MhgdEKltQnLZJa8ET+TjNg1u1tpRumbFKy47OkdQ8RVy9v9At3HPW
 cTld/T/obtKbzMgfr1akakfHGyCsI7bDAf/mwBvYkRnmazLfFE2W3U86eIhyQ9Yx2VZG
 9B+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696986081; x=1697590881;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qya31W9YBJ8jOwGlDzkTtT3a4oUoppVZSkQ76dfvfI4=;
 b=AdhfhEWZ8LVgfyefZsOB/fPqIFrEU9GYCNQ7+ytXhRu5oCNL6oVY0xPRXERNT06Yxx
 hDPEM8wQ1hqyPUSpIBOIbh0QxUXogCkjVfsjgZgffgVP/3mz9cYb1K9Zvm8YpAB2ntj5
 GjXR5qvzC4FS+hN47/yPgi27g32MrW0cLd19gjjY4NiUUEMI8J0R/w6sGywV+68fuUSN
 g++j2L+PyTbuMmV5QozIdkR9hEnFQqcVhSOxRfFC/6SyZ9ufBy9VYsX7B/MjNSIo0K9d
 m3pBpJvY6qSRR7C4UidN2VzdjEWOZ8cguHlvnUGg2hkLlabj8cdCxcO78hu0gkVWRn7i
 bauA==
X-Gm-Message-State: AOJu0Yz2BOYWrSSRr7mVRlaEi0sp1l/4YNFmn/rt/Roj4woD2mAKdEzT
 e4OfyiWCqqWL/SDylouRHt77ycVVjXqMvdltv0g=
X-Google-Smtp-Source: AGHT+IGuGBMu+fD2eeIzNW1kyXyJJ68VOmVAx+oSmgAtCubp7HN2WQLRGSI9Xtoi0HeHnLLEfUyvlGbFnInTZH+TSsI=
X-Received: by 2002:a05:6122:3193:b0:495:f495:bab1 with SMTP id
 ch19-20020a056122319300b00495f495bab1mr11941489vkb.0.1696986081169; Tue, 10
 Oct 2023 18:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-9-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-9-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:00:54 +1000
Message-ID: <CAKmqyKMOSLJ-D2+XPmcYZcBDEFzc+2FypYjb_Kv2qoyeG16oAg@mail.gmail.com>
Subject: Re: [PATCH 08/25] gdbstub: Fix target_xml initialization
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, David Hildenbrand <david@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, 
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Oct 10, 2023 at 4:36=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> target_xml is no longer a fixed-length array but a pointer to a
> variable-length memory.
>
> Fixes: 56e534bd11 ("gdbstub: refactor get_feature_xml")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20230912224107.29669-2-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdbstub/softmmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
> index 9f0b8b5497..42645d2220 100644
> --- a/gdbstub/softmmu.c
> +++ b/gdbstub/softmmu.c
> @@ -292,7 +292,7 @@ static int find_cpu_clusters(Object *child, void *opa=
que)
>          assert(cluster->cluster_id !=3D UINT32_MAX);
>          process->pid =3D cluster->cluster_id + 1;
>          process->attached =3D false;
> -        process->target_xml[0] =3D '\0';
> +        process->target_xml =3D NULL;
>
>          return 0;
>      }
> --
> 2.39.2
>
>

