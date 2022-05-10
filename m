Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noLwy-0004C0-P5
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 05:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noLws-00048W-Ah
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 05:14:30 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:42732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noLwq-00073s-5q
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 05:14:29 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id i11so7519664ybq.9
 for <qemu-riscv@nongnu.org>; Tue, 10 May 2022 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3RofmkJZc0erz0aFGxAWkPhQH5on/WdQGNq0i5D1x7w=;
 b=V7m5dugOgNtJKbDLEd0VU+TAYQmk0yEfCYnKU7qnUPrrDtGNeBiYEpoIZtSq9OQwqS
 7f/qb7qzZmkAgw+Sc7KJ5jalqN//L+TRWxEOeuLnTEjG3E2nTxxbaPymVx2AgTNungVl
 ueWKUp9rzcSphifBpGzRfXDrYPi8ftKmlERWOj3gouI1ENMWWRbN1YLruwWDFSNdjlg0
 AclszjvXDQ5RGe8Uvg6hjnqD9ZR3KnG/nZORHEaDz0S7E+IJCF9NC2djlY+i+3mO0dCM
 tyrWBpWFvgWMeYFljDpaYgEvhktY56w/vi+Lb/36rFHIhKSSlGHOiUYq9eQ1pQ/RSet4
 vncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3RofmkJZc0erz0aFGxAWkPhQH5on/WdQGNq0i5D1x7w=;
 b=UIzoqYJM4oJ4QyfbW4agPAvrNdnbYcOdudFB5CnNRhby953YeoH50MJpb6+k1dmQqQ
 lzwNGpfXLbceS63qZ9OF+43YQRFzY61Z9Uy/qKlzHtkyiVz9yO9pTso3lU5rTwETUiis
 7mu/y2B5Qww0AUFmULTZ9MuEeiuH9fyb7NN3sOsMTVpSJMQH1UoSjg/jufCoEZriuaC2
 hyCoCXyzK25+wHBh9XZrz84Jf0HHJMTQK+m4jfCT0fBoxefh8Pcvsx4pVLV5qlFp9xof
 JLk58wHNuYbXseohBaZY6twqm2P0TprlRpVtOlBLEpuYtNCWdXwS0KbwoVdCCjJV+uuj
 sLKg==
X-Gm-Message-State: AOAM531xNQD/sEy3XjHbYOPtobypJYT4uhyESoX9OzEB9W8t7AKvpEeT
 LQkJX6wIAQ4gxi7nB6WeCQYuoqe6nCDZO4VqSE4NHg==
X-Google-Smtp-Source: ABdhPJxXDZnPlGqTD9AsX6pevQ9fx3U9+xf3MlMzFVImbN21uquI+408S0hSBqOe73dYdqmbVbpqIumPqaTiwgJafBg=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr16398377yba.193.1652174066198; Tue, 10
 May 2022 02:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
 <877d6tzs2e.fsf@pond.sub.org>
 <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
In-Reply-To: <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 May 2022 10:14:14 +0100
Message-ID: <CAFEAcA8Ff45KeuQm-v8MwXX_i+P51uF-ovpQvtGD3hx1bi3A9g@mail.gmail.com>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, 
 muriloo@linux.ibm.com, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com, 
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-RISC-V <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
X-List-Received-Date: Tue, 10 May 2022 09:14:31 -0000

On Tue, 10 May 2022 at 10:01, Thomas Huth <thuth@redhat.com> wrote:
>
> On 10/05/2022 10.54, Markus Armbruster wrote:
> > Thomas Huth <thuth@redhat.com> writes:
> >
> > [...]
> >
> >> I once suggested in the past already that we should maybe get rid of
> >> the 32-bit variants in case the 64-bit variant is a full superset, so
> >> we can save compile- and test times (which is quite a bit for QEMU),
> >> but I've been told that the 32-bit variants are mostly still required
> >> for supporting KVM on 32-bit host machines.
> >
> > Do we still care for 32-bit host machines?
>
> As long as the Linux kernel still supports 32-bit KVM virtualization, I
> think we have to keep the userspace around for that, too.
>
> But I wonder why we're keeping qemu-system-arm around? 32-bit KVM support
> for ARM has been removed with Linux kernel 5.7 as far as I know, so I think
> we could likely drop the qemu-system-arm nowadays, too? Peter, Richard,
> what's your opinion on this?

Two main reasons, I think:
 * command-line compatibility (ie there are lots of
   command lines out there using that binary name)
 * nobody has yet cared enough to come up with a plan for what
   we want to do differently for these 32-bit architectures,
   so the default is "keep doing what we always have"

In particular, I don't want to get rid of qemu-system-arm as the
*only* 32-bit target binary we drop. Either we stick with what
we have or we have a larger plan for sorting this out consistently
across target architectures.

-- PMM

