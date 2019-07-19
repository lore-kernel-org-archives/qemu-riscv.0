Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoQnN-0001Fc-2N
	for mharc-qemu-riscv@gnu.org; Fri, 19 Jul 2019 07:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34415)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hoQnL-0001E9-75
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 07:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hoQnK-0004ih-7x
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 07:11:23 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:34429)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hoQnK-0004i5-24
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 07:11:22 -0400
Received: by mail-ot1-x335.google.com with SMTP id n5so32382832otk.1
 for <qemu-riscv@nongnu.org>; Fri, 19 Jul 2019 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tY9kweh1a3zqDq9ZuVKK8f0DLTDET8dYAzpexDaploQ=;
 b=GUhzQKLz1njaPHgothghIoDK6B5peCqFIgiKiRdBxVe8a4LuIJcbbA/ruP//VotN+q
 7N/ts7EZs+ei+/GIWulinIPIFV0AiELpInQQdIFHS11q19pj7qDWGpOFpG6MkauBMxGD
 VIgxCdDa2hfkrFzM5KP9jVmJnEVGx2Lp0i3iM1Nv+rOw2jB0OXsJ/U2cbnV5wkZBp5RM
 R4OAtYaKdSErnTamD7P+quzSqZes40AN0+8LmdAG7S4EnQntrRyI6LtR22a+OFTH3R1g
 /Zz3DmSgXhAgnFco99XmpBmyTts3vbYcruT5Q3yJa62sukwooVMuUbs+tbi6o0aVmUzT
 Y1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tY9kweh1a3zqDq9ZuVKK8f0DLTDET8dYAzpexDaploQ=;
 b=K5WlDUVw2xZREW80PhVaSrhvG8Zsou2lG/BzDcM0S+yqXfR8BjBnon2fj/uz4V07qK
 XfRaSKkD2lcuMskJGwYAOT+zJGoSHF0Y2v3vMzcTtW9SiFLnIePRopzXLIO241XliSLV
 Dn6FY7ZDJCpt7HlnL8MfvRUsH2ExtKCzQGGxD7rJorKqkDGwB0TbkZ7CGSGckxn+vRIC
 7gamFptFcxMQgoFPHSoBpKKqFc7TwRNTnsTwqE5ONG1LRjdhW3mmbBmIt9BNWOZS954o
 S1dzIioP2F+HN9+YUo80DyYdo6EaZ52l5C+InZKW7AP1q0qC88OV/5tOA/TW9pM/Zva2
 DPQg==
X-Gm-Message-State: APjAAAXYbrTqC+cI4YHx8JfaHHnw8T79Upsb04LhaFRuW9Y5kY0RdIug
 mqJ9a1mwgGUpJqPz+jLUnlWKc0GXha5RQXbvcLoKww==
X-Google-Smtp-Source: APXvYqyb1O4mXr76hgmuuobu8OgUflrOYqSmuD8pQIlG0FScmE6IrEaxNhoC7HvylEbLdtQcip4hkCkvvFPy+l6EW6A=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr36435938otj.97.1563534681206; 
 Fri, 19 Jul 2019 04:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190719015811.14776-1-palmer@sifive.com>
 <CAFEAcA_MGz=EvH67twNoM-SMXZ8_pE6FhO+JuLN=0Z1H6sfRnw@mail.gmail.com>
In-Reply-To: <CAFEAcA_MGz=EvH67twNoM-SMXZ8_pE6FhO+JuLN=0Z1H6sfRnw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jul 2019 12:11:10 +0100
Message-ID: <CAFEAcA9mR5XxV9ghSzt4PbANKZJW1xKMGF1a9+ak+m6OyZ-YZQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <alistair23@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::335
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for 4.2-rc2
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
X-List-Received-Date: Fri, 19 Jul 2019 11:11:24 -0000

On Fri, 19 Jul 2019 at 12:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> This passes the 'make check' tests but it prints out a lot
> of warnings as it does so:
>
> qemu-system-riscv64: warning: No -bios option specified. Not loading a firmware.
> qemu-system-riscv64: warning: This default will change in QEMU 4.3.
> Please use the -bios option to aviod breakages when this happens.
> qemu-system-riscv64: warning: See QEMU's deprecation documentation for details
>
> (repeated 7 or 8 times during the course of a test run)
>
> Can we make the tests not trigger warnings, please?
> (I have a filter where I search through for strings like
> "warning" because warnings that shouldn't happen often don't
> actually cause the tests to fail.)

Forgot to mention, but a common way to do this is to say
"don't print the warnings about bios image loading if
qtest_enabled(), because with qtest we never execute any
guest code anyway". That will probably fix the warnings here.

> Also, I notice that you have a typo: "aviod" should be "avoid".

Also also, the warning message mentions "QEMU 4.3", but our
versioning system bumps the major version every year, so
the pending release is 4.1, the next one will be 4.2, and
then the release after that will be 5.0 because it will be the
first release in 2020.

(Plus, your merge commit message says this pullreq is
for 4.2-rc2, which is a typo for 4.1-rc2 I assume.)

Since this pullreq does pass the tests, and rc2 is not far off
now (Tuesday), I think my suggestion is that I'll apply this
as-is, and we should fix up the issues with the warning messages
as a followup patch. I think that's better than holding this
out of master and making it risk missing rc2.

thanks
-- PMM

