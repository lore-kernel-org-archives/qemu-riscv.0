Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPke-0006xZ-1l
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1mQPkb-0006ux-Sr; Wed, 15 Sep 2021 03:54:37 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1mQPka-0004SU-Hc; Wed, 15 Sep 2021 03:54:37 -0400
Received: by mail-pl1-x629.google.com with SMTP id v2so1113709plp.8;
 Wed, 15 Sep 2021 00:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E3gAr87EDemAc8yEwCl6/Y8xliZAWl1VYELf/UlFmJo=;
 b=pTuB/N6YJm9LCrs8qN/14kPcAcSRNzMSqJDO7/oM5rP8imKClM5xjzOs1WabCSw4zd
 hHfF6Ym29I4GSIub1ow1fotXJqYK7W1dLcMAu4l12vAry/0Re8bVqXK6Lhj2Nh90rAHO
 JIXROfZIwYweBk7r7scwCBCRGQsG4yYlx9a97nEAJ0w+cxCnJu7Phet/JRNtMUJ0aAOc
 kihyf6mSvsT/Y1IMbIXIDRhFiKwE8cibqB8/15QMA1+ieanh5h2H85nlFe8LdnIY6Bfd
 pyq0I4MMOTQHkwqAQSpukDrRicA3Uyf5ywkUKMxJaSwB2V39u7+/L4sOY950kOviZDSg
 jfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E3gAr87EDemAc8yEwCl6/Y8xliZAWl1VYELf/UlFmJo=;
 b=B+c9HLROwYHcrcImHWpoOxN703QqVeyp7T4qKNsVONSk661XDX4KvDd2VmvMLzUeM+
 Rk0Ewj+VTMol0saYYdhwjGzdq9VQX46oSvg5kCO0vgXtTWFaauylvs3nv2Afh0YB/tyF
 rXqchOesJWYueOwZph+CFF0nkMgmOIHdh3X5tGLnTU/P1UJ6CyFrcD+WmS+9RW3s+AYT
 e420tOwU+nts2ozrbEk789Syk9ChY5T5Fc6l84sI7E1ChcPzjBq1fUsYBAJO0rNbqjzT
 ZlJMhlSpL0RUE8SvGLhW2QZZ0bEuAzAaSu41q8AtrzSI7kY+wuucdHU0j93UfpHKNLYW
 I70w==
X-Gm-Message-State: AOAM532uskebz2f3LUT7ODquCajdEPpDzBa4LwMf5127YCg7kIq/2Zq4
 +H63Wp1bhCxPPFZpFL/GWWdqjikgBZKYYTDD49w=
X-Google-Smtp-Source: ABdhPJzEu2x0f0ggBgFjBVZqFs1UFWTkCQeoZ6/6tvr+NtX8TdMetf4FHU7hRGghu1+WrApGvYt/YNDr6iAcAtRDaRE=
X-Received: by 2002:a17:90a:2ecb:: with SMTP id
 h11mr7086196pjs.196.1631692472568; 
 Wed, 15 Sep 2021 00:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-28-berrange@redhat.com>
 <1cb38e8f-cc05-461a-c722-efb18519f6fe@amsat.org>
In-Reply-To: <1cb38e8f-cc05-461a-c722-efb18519f6fe@amsat.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 15 Sep 2021 00:54:21 -0700
Message-ID: <CAMo8BfL6V6HsYg1RGE8yNWLcOiHjkBxDzk4XSE6_AGpqkcx7rg@mail.gmail.com>
Subject: Re: [PATCH v2 27/53] target/xtensa: convert to use format_state
 instead of dump_state
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, Taylor Simpson <tsimpson@quicinc.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, 
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, 
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.689, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 15 Sep 2021 07:54:38 -0000

On Wed, Sep 15, 2021 at 12:32 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 9/14/21 4:20 PM, Daniel P. Berrang=C3=A9 wrote:
> >      if ((flags & CPU_DUMP_FPU) &&
> >          xtensa_option_enabled(env->config, XTENSA_OPTION_FP_COPROCESSO=
R)) {
> > -        qemu_fprintf(f, "\n");
> > +        g_string_append_printf(buf, "\n");
>
> g_string_append_c(); simpler to move it before this if() statement.

It adds spacing between optional blocks, why does it need to be moved out?

> >      if ((flags & CPU_DUMP_FPU) &&
> >          xtensa_option_enabled(env->config, XTENSA_OPTION_DFP_COPROCESS=
OR) &&
> >          !xtensa_option_enabled(env->config, XTENSA_OPTION_DFPU_SINGLE_=
ONLY)) {
> > -        qemu_fprintf(f, "\n");
> > +        g_string_append_printf(buf, "\n");
>
> Ditto (move out).

Here as well.

--=20
Thanks.
-- Max

