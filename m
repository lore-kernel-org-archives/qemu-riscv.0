Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nc3cj-0003yQ-VJ
	for mharc-qemu-riscv@gnu.org; Wed, 06 Apr 2022 07:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nc3ch-0003v3-SU
 for qemu-riscv@nongnu.org; Wed, 06 Apr 2022 07:14:51 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:46896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nc3cf-0008Iw-8x
 for qemu-riscv@nongnu.org; Wed, 06 Apr 2022 07:14:51 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2eb888cf7e7so21727347b3.13
 for <qemu-riscv@nongnu.org>; Wed, 06 Apr 2022 04:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MkKxjYAV/v0VMd11SMXqG8EhXPeJQ34GzLrs6aLHBhk=;
 b=BnkL/xviW3/SATQQBN0J4jLUdrTQRMmZsVp7lEWCOmkmWwekK4I3vVJpW5wY+oaW6o
 wMWw7poztVXO8dmLd+4dn47QCBX/MLXDvtQ0FtncjF48Ky/apTe5LetGClF9I8xv8hLd
 39QIq1nCVrCyq+b89tHhY+wy8NDABlDcruy0U3VUH+wy5CC/74PQNoqlWZUGpPI4ktd2
 2syhOC3nTsaeBG0iofZAEy+fKLdo2YsKyo/Wo++rIt2NrTU9fzPbBH0Ng8KlfS5PTmtk
 EZZmtp49FjP3cappOUQR7sHOielNZL7XjaQF+GBy228W5SABlrjalbp+fGs0YWTIyb9y
 NQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MkKxjYAV/v0VMd11SMXqG8EhXPeJQ34GzLrs6aLHBhk=;
 b=kKLVjrCcYkjr+Ch67Cg1oc6LW78osjRVIYi7e1QnH42qf8WuVVMTMNUg5q59uzONOg
 RpqQgD7peI3warCRvvMPyHG2hErYDYpAMCFSGutaUmcGhJHZDExP5scJviAbAPgsFPoH
 57rhP1x8IhWWqOjAWwq2pzw+JREEVikzyoe/cicWl+uMdxg4kTdHGktqfU3RRJguTcxC
 UxWbeds9YNfAB93mpb+DRgtjmDZGH+H9DDmToIviIO6GavRskHpVh8teXpaeEylzZ1j5
 n7tyKxRW5hiO13wN2Ru+SRF+HZJd8CwWpp1mHCCQ0FPjuOK+URW2E95ZTCXkZxOgJiUm
 02XQ==
X-Gm-Message-State: AOAM531RAg7DqxK4W5nX991gLo/ggQOVVGVSIFoietNS+1POOP8wDEN0
 cE5Nac+3GKJCHT/IlBL2gn6kU4CElYSEn7IiDnaKFA==
X-Google-Smtp-Source: ABdhPJytWaKSjrcKoa2mbzwJv7RhwFSgw11lPqUjgtEaNT3OmaJMCRA7mDMdyjLwii6p/gHggvStzLZXxV0l/YkXcmI=
X-Received: by 2002:a81:1592:0:b0:2eb:5472:c681 with SMTP id
 140-20020a811592000000b002eb5472c681mr6491648ywv.10.1649243687745; Wed, 06
 Apr 2022 04:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-33-marcandre.lureau@redhat.com>
 <CAARzgwzXXKqhvP9CnST3iD_obfqCWn8Z+8WNcs0u-O_UGoM1-w@mail.gmail.com>
 <87o81epk1s.fsf@pond.sub.org>
In-Reply-To: <87o81epk1s.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Apr 2022 12:14:36 +0100
Message-ID: <CAFEAcA9kYweS2zMHjWDuV_y2AxKbgJ5UYNHLK3sASCLVD=yEqg@mail.gmail.com>
Subject: Re: [PATCH 32/32] Remove qemu-common.h include from most units
To: Markus Armbruster <armbru@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com, 
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alexander Bulekov <alxndr@bu.edu>, Alexander Graf <agraf@csgraf.de>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, 
 Alistair Francis <alistair.francis@wdc.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 BALATON Zoltan <balaton@eik.bme.hu>, Bandan Das <bsd@redhat.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, 
 Cameron Esfahani <dirty@apple.com>, Chris Wulff <crwulff@gmail.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Colin Xu <colin.xu@intel.com>, Corey Minyard <minyard@acm.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
 Fabien Chouteau <chouteau@adacore.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>, Helge Deller <deller@gmx.de>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
 Jagannathan Raman <jag.raman@oracle.com>, Jason Wang <jasowang@redhat.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Joel Stanley <joel@jms.id.au>, 
 John G Johnson <john.g.johnson@oracle.com>, John Snow <jsnow@redhat.com>, 
 Julia Suvorova <jusual@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, 
 Kamil Rytarowski <kamil@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, 
 Laurent Vivier <Laurent@vivier.eu>, Li Zhijian <lizhijian@fujitsu.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, 
 Marek Vasut <marex@denx.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Max Filippov <jcmvbkbc@gmail.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Stefano Garzarella <sgarzare@redhat.com>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, 
 Taylor Simpson <tsimpson@quicinc.com>, Thomas Huth <huth@tuxfamily.org>, 
 Tyrone Ting <kfting@nuvoton.com>, Warner Losh <imp@bsdimp.com>, 
 Wenchao Wang <wenchao.wang@intel.com>, Yanan Wang <wangyanan55@huawei.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Zhang Chen <chen.zhang@intel.com>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390-ccw boot" <qemu-s390x@nongnu.org>, 
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>,
 "open list:raw" <qemu-block@nongnu.org>, 
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
X-List-Received-Date: Wed, 06 Apr 2022 11:14:52 -0000

On Wed, 6 Apr 2022 at 11:45, Markus Armbruster <armbru@redhat.com> wrote:
>
> First of all: thank you so much for completing the "empty out
> qemu-common.h" job!
>
> This is what's left:
>
>     #ifndef QEMU_COMMON_H
>     #define QEMU_COMMON_H
>
>     /* Copyright string for -version arguments, About dialogs, etc */
>     #define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
>         "Fabrice Bellard and the QEMU Project developers"
>
>     /* Bug reporting information for --help arguments, About dialogs, etc */
>     #define QEMU_HELP_BOTTOM \
>         "See <https://qemu.org/contribute/report-a-bug> for how to report bugs.\n" \
>         "More information on the QEMU project at <https://qemu.org>."
>
>     #endif




> Rename the header?  Or replace the macros by variables, and move their
> declarations elsewhere?  Not demands; this series is lovely progress as
> is.

We should put those in a qemu/copyright.h, I think.
Leaving a "qemu-common.h" around is an open invitation to people
throwing more random stuff into it again in future.

As you say, we can totally do this as a later followup.

thanks
-- PMM

