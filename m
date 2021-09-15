Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPGT-0002d1-JX
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPGR-0002Xl-7L; Wed, 15 Sep 2021 03:23:27 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPGO-0002p5-DV; Wed, 15 Sep 2021 03:23:26 -0400
Received: by mail-oi1-f180.google.com with SMTP id p2so3026257oif.1;
 Wed, 15 Sep 2021 00:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ilQjEm8OlfUVO/EfW0ZzuEU03Y58OtsvWPlSvoAkL6U=;
 b=OA5lEp5hSPtY1JN+vz/3ztuN+M8s0w2/30TzODfzG+Eozoj8cxxanTDlQN0ryQ3Od/
 3THOutfZuHv0N1CB0FHkx3I5j1T5EZIOb8hy75sFfa2IBKN2x0R6e0i04AnvUZAsJQPu
 zKQDcrWwgmKkzUFa1mBjijDFFTlCUxHApkPJhqNutOg24HF1esFliNY/NyDBeinGNjhx
 yZnS55IkMTdO43UGZUCcoaCi2k8JsdeNIviWyjOU+DDpmmMkoZh0Lyv2KrrLDaJirHH+
 oB5P7uFS3x/ZO1dtZt8rnlZuL070C2tYTwm8P43e1zn6IJlTstLBdM40s+peIqxs8TFe
 tMxQ==
X-Gm-Message-State: AOAM533oGImp3N8edd/j3DXdJ9xRfk1ft8hpOBD+ZNeCyD9PtYVNu1OP
 VAgogFd+1BQp9NKZn75RtTQECxMnyEJ3qoOolUI=
X-Google-Smtp-Source: ABdhPJyqiaJSRWyYbadzY0AnFjKFXHhosu5U3qd3Xq1453BbAoTb8CpmbzVpstTECbo7z1ULERPriedziy3Ks4NwTgU=
X-Received: by 2002:a05:6808:10c8:: with SMTP id
 s8mr4153074ois.175.1631690601768; 
 Wed, 15 Sep 2021 00:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-17-berrange@redhat.com>
 <21032bce-bdbb-1a0f-f5a5-71350ad79c85@amsat.org>
 <7b38445c-5225-1d75-2b49-486af35a9e1c@amsat.org>
In-Reply-To: <7b38445c-5225-1d75-2b49-486af35a9e1c@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 15 Sep 2021 09:23:10 +0200
Message-ID: <CAAdtpL4vEfdOfRjmQfU7iP3zPhBkSB-j7t6hL3c+OCBQM-NrPw@mail.gmail.com>
Subject: Re: [PATCH v2 16/53] target/microblaze: convert to use format_state
 instead of dump_state
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, 
 Peter Xu <peterx@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, 
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 "open list:vfio-ccw" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.180;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Sep 2021 07:23:28 -0000

On Wed, Sep 15, 2021 at 9:21 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 9/15/21 9:18 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 9/14/21 4:20 PM, Daniel P. Berrang=C3=A9 wrote:
> >> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >> ---
> >>  target/microblaze/cpu.c       |  2 +-
> >>  target/microblaze/cpu.h       |  2 +-
> >>  target/microblaze/translate.c | 45 ++++++++++++++++++----------------=
-
> >>  3 files changed, 25 insertions(+), 24 deletions(-)
> >
> >>      for (i =3D 0; i < 32; i++) {
> >> -        qemu_fprintf(f, "r%2.2d=3D%08x%c",
> >> -                     i, env->regs[i], i % 4 =3D=3D 3 ? '\n' : ' ');
> >> +        g_string_append_printf(buf, "r%2.2d=3D%08x%c",
> >> +                               i, env->regs[i], i % 4 =3D=3D 3 ? '\n'=
 : ' ');
> >>      }
> >> -    qemu_fprintf(f, "\n");
> >> +    g_string_append_printf(buf, "\n");
> >
> > g_string_append_c(), otherwise:
>
> Actually we don't need an extra newline.

Oops sorry here we do.

> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
> >>  }
> >>
> >>  void mb_tcg_init(void)
> >>
> >

