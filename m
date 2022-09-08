Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWDhs-0006b7-82
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 05:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDhm-0006YF-6k; Thu, 08 Sep 2022 05:20:14 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDhj-0000rV-8s; Thu, 08 Sep 2022 05:20:13 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t65so5210092pgt.2;
 Thu, 08 Sep 2022 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=psmuQoLNM4dcFODHuk4RuqP5oc9CbH+yEHo6hcNKa+g=;
 b=gIJTjN3vJNccLXSECyJO29njTaBUmQgCioo1K8u1mbyUNAgMB9iM1verYWzak21Ltc
 +ZqKFuUIWoIk4fuOkPsef5etoMFMzH9QxP2s+1muH7PVVsagtSXBQ7U0XEqpoOntc6X+
 Yyo3pjia3RAgK8YiqdGMTy3Z4NL9sWqH2tNuNiU7D6/aG+p7JClhMo8tb2EVe0mijevB
 7VKV9rsT90HOTsdnqDnG+g1h+cjZODnPnQG20q7FXKbMW6qDuSApMv5a2wnI513Yzgsk
 nR0Q4ObnR96zJXf6/0nFZsYkyDWWSiJMM5/fh2KMYM41y24xXGLtUXlFTslmc5ZZVyWP
 IUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=psmuQoLNM4dcFODHuk4RuqP5oc9CbH+yEHo6hcNKa+g=;
 b=GcHVlHImiaITIrHfGtF7p6f/GQqNc3Dth4ovOQ2SNldKpBQudlkE4vdVSeRZx7Shih
 pvDGbXUJhEtpVzbGfaI1Djv205TzKpw1ZMApqwCMxxD0syjNxWYn9RjZ1vivMvNDzEd9
 lLlCOSRLXRDRGyVnEvIGZZJ/Hd2f87I+0xfrP93kA/xfqxcl02MPAIhwgxS4njik2R+A
 6NgGF+w3R51kT2I9Qk3N/1abYI4aPiwbQFw9pmYSI8jpawGQ8jOCUkheBq5LxdOkEPcP
 0up09mfM+U7+H00dTLo35/g+T5GsO1nZb7rKp521QZkn6fCHkAALwcGqzypPaIl8wKFk
 VzkQ==
X-Gm-Message-State: ACgBeo2ipDlj8X9jKMoOBp7ImcUfhVLMNmqUFauV0x0sd3b79298MwTz
 pxxGSAOQOpK4JBFT/1gmoppsdWYrdhIW924CwQmnMuarKYK1l0Z88Hs=
X-Google-Smtp-Source: AA6agR6p3P4FNGERyiB8xvunxI3skXnsZoTkKUWqiDMQSQCLsNN7gcsdhi9RzeojoA2mgGNhQ2mBJL1RHsLYDaglAAU=
X-Received: by 2002:a63:5b15:0:b0:42b:bb74:a2da with SMTP id
 p21-20020a635b15000000b0042bbb74a2damr7059651pgb.406.1662628809378; Thu, 08
 Sep 2022 02:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220905163939.1599368-1-alex.bennee@linaro.org>
 <CAKmqyKPtuT+BT7S=G3v05=s00p4OE8X+tNaccNsN7sn3yJwbcw@mail.gmail.com>
 <87r10ok7sk.fsf@linaro.org>
In-Reply-To: <87r10ok7sk.fsf@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 11:19:41 +0200
Message-ID: <CAKmqyKM_f1PWbesKE-EU5U9VP4iVoZB1oaF_u5VuiEAuZg4YMQ@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/system: clean up code escape for riscv virt
 platform
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 08 Sep 2022 09:20:18 -0000

On Tue, Sep 6, 2022 at 2:26 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Alistair Francis <alistair23@gmail.com> writes:
>
> > On Mon, Sep 5, 2022 at 6:39 PM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >>
> >> The example code is rendered slightly mangled due to missing code
> >> block. Properly escape the code block and add shell prompt and qemu to
> >> fit in with the other examples on the page.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Are you going to queue via your tree?

Yep! It's applied now, was just catching up on the first 7.2 PR

Alistair

>
> --
> Alex Benn=C3=A9e

