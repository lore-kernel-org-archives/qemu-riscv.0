Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1uuJ-0004Rm-M1
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 12:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uuH-0004Nb-Pt; Tue, 19 Jan 2021 12:35:05 -0500
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:43507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uuF-0000Dw-Jo; Tue, 19 Jan 2021 12:35:05 -0500
Received: by mail-io1-xd30.google.com with SMTP id x21so23018646iog.10;
 Tue, 19 Jan 2021 09:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uckWWWjAq++tc1xguD4EkjJfOnMfhV6QH7N6POaP7o4=;
 b=h/T4PrPtbbQOMxQI4qAtTA//GD8hS2IpG2sqY0ze6HTv+ilPv4wVpYqwyyDLhYMGZm
 GWFA1DUIsWER1bZ3jOQzpHOiBvt8N8T0mCb7/NTxc+ZeWAkvMbeTCNnczsCNlrAjK8lc
 QMcH9cabsQ5a6tJf0vaaqV0qCycNWFSHw7leteB80tm/ir0gz9lsgMQn1zL44AZYNh8m
 Aq/e6SxPhA49hj6vI3NaQqA/iSa1MrIkTPgRKmGTj3WBlNZLpBWX6L30Y6O+NCC7RPS1
 2aZSOB2olxZazn6mNBPDCKvx9voFJvHq4qOgef19B16QmKk1DUqgFyjOfQAioXRzM5Sd
 5JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uckWWWjAq++tc1xguD4EkjJfOnMfhV6QH7N6POaP7o4=;
 b=C1epse0alJdysVl7pAcXhBWlMEwD9l+4tNOzzQYibfCaZCv9xPIDFKdx0MmLs3SKKV
 Hm33Hi6ClASTJ5IaeYcmRWs+Gn0prXXX+LB0UgMG1IzkLA5muaJIzKbNyB4aMDwE36Sg
 3q4zcGWioZ8daf4rgn2OIHbcwefVnGJ0AtTh2pQaE6uMQNWM+DHBOAeMTJAijXOgwTzO
 moS38pmQNQHDHD4xSw2XZpBRVV/b8Vk3tvNV+rUfR5rkPajWd/TTv3prqQ3MpGbIuQ0W
 fnvkuaoHejU5/dJn4O9oxivwmz0UD6nw6I6DewkN/Gox0L5UFM8zKkldZ4CtZ6WKjOlM
 RsvQ==
X-Gm-Message-State: AOAM533QJrc2My2gq0EQ6IA2EACuJhkCO3uibNi6fEkGpAdzQUWxfatQ
 GRfj+NuIRu6+UW6+GblHxK4aFb+9fjpYc4kiG9g=
X-Google-Smtp-Source: ABdhPJxMGyDk2WhETcOC0qWCyzHyuUJdlBvu12JDKFR12hIB+UUdNAHz6yHv4dcud2o5NEkAo08tS1lyDRzwy1eRq3Y=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr4343246ild.267.1611077702116; 
 Tue, 19 Jan 2021 09:35:02 -0800 (PST)
MIME-Version: 1.0
References: <1a4df1b5638d73b64200add175be9d69013418d8.1608401453.git.alistair.francis@wdc.com>
 <eac70d13-7e70-756e-503c-329fdb14a312@vivier.eu>
In-Reply-To: <eac70d13-7e70-756e-503c-329fdb14a312@vivier.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 09:34:36 -0800
Message-ID: <CAKmqyKMM-vfWzDWSxBe2XhLmKQ2g7pWOg+GmeDtbDLR=o4xOCg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] linux-user/signal: Decode waitid si_code
To: Laurent Vivier <laurent@vivier.eu>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 17:35:06 -0000

On Mon, Jan 18, 2021 at 6:36 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 19/12/2020 =C3=A0 19:11, Alistair Francis a =C3=A9crit :
> > When mapping the host waitid status to the target status we previously
> > just used decoding information in the status value. This doesn't follow
> > what the waitid documentation describes, which instead suggests using
> > the si_code value for the decoding. This results in the incorrect value=
s
> > seen when calling waitid. This is especially apparent on RV32 where all
> > wait calls use waitid (see the bug case).
> >
> > This patch uses the si_code value to map the waitid status.
> >
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1906193
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  linux-user/signal.c | 26 ++++++++++++++++++++++++--
> >  1 file changed, 24 insertions(+), 2 deletions(-)
> >
> > diff --git a/linux-user/signal.c b/linux-user/signal.c
> > index 73de934c65..b6c9326521 100644
> > --- a/linux-user/signal.c
> > +++ b/linux-user/signal.c
> > @@ -305,6 +305,7 @@ static inline void host_to_target_siginfo_noswap(ta=
rget_siginfo_t *tinfo,
> >      int sig =3D host_to_target_signal(info->si_signo);
> >      int si_code =3D info->si_code;
> >      int si_type;
> > +    int status =3D info->si_status;
> >      tinfo->si_signo =3D sig;
> >      tinfo->si_errno =3D 0;
> >      tinfo->si_code =3D info->si_code;
> > @@ -349,8 +350,29 @@ static inline void host_to_target_siginfo_noswap(t=
arget_siginfo_t *tinfo,
> >          case TARGET_SIGCHLD:
> >              tinfo->_sifields._sigchld._pid =3D info->si_pid;
> >              tinfo->_sifields._sigchld._uid =3D info->si_uid;
> > -            tinfo->_sifields._sigchld._status
> > -                =3D host_to_target_waitstatus(info->si_status);
> > +
> > +            /*
> > +             * Map host to target signal numbers for the waitid family=
 of
> > +             * syscalls. This is similar to the functionality in
> > +             * host_to_target_waitstatus() except we use the si_code t=
o
> > +             * determine the operation.
> > +             */
> > +            switch (info->si_code) {
> > +            case CLD_KILLED:
> > +            case CLD_DUMPED:
> > +                tinfo->_sifields._sigchld._status =3D
> > +                    host_to_target_signal(WTERMSIG(status)) |
> > +                                          (status & ~0x7f);
> > +                break;
> > +            case CLD_STOPPED:
> > +                tinfo->_sifields._sigchld._status =3D
> > +                (host_to_target_signal(WSTOPSIG(status)) << 8) |
> > +                    (status & 0xff);
> > +                break;
> > +            default:
>
> I guess the the operation is not encoded in the status coming from the ho=
st as we need to use the
> si_code to decode the status, so why do we need to encode it in the statu=
s we send to the guest?
>
> Can it be only "tinfo->_sifields._sigchld._status =3D status" for all the=
 cases?

That also works, I'll send a v2.

Alistair

>
> Thanks,
> Laurent

