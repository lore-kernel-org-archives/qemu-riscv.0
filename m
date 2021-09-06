Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mN5HF-0000Mz-2K
	for mharc-qemu-riscv@gnu.org; Sun, 05 Sep 2021 23:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mN5HA-0000LL-HH; Sun, 05 Sep 2021 23:26:28 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:38836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mN5H8-0005Vb-NQ; Sun, 05 Sep 2021 23:26:28 -0400
Received: by mail-yb1-xb36.google.com with SMTP id v10so8029912ybm.5;
 Sun, 05 Sep 2021 20:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vTaD/8LbizF927Imzapkky1CKciUf5cwKAj1HGozbw0=;
 b=pCa5r5YNM5BdpllsYmmRjvbmOyar9N8bCz2JWflZ9QXBn7PG4m/jA9CNbphZnGXiLw
 IwhnKNm14mVaB3M3C0VxJAtUhxC0ZJ3PXLCu0U8Hbq1OwcZ9EzTq5uQ3NCHXE0Kz0hEU
 kahSbucMh0DnTKySWTEzRFVB1dfobA6jX+aFeQpHz7ApCU5o5W8LzmC/A8qszyyOXjKu
 5nDVZPv/IbtEcHoD++cqcn7yzNMyi1Z8PIhBqabL2WjBQGcrEXezlxkdRMZAdrLg86gn
 qXN3Vn53F8WiALxN1tCHEuG519tXeSBGXONaOLIRR5g2VonF4z6x2p6CEEL/qkfXrE1T
 mWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vTaD/8LbizF927Imzapkky1CKciUf5cwKAj1HGozbw0=;
 b=C+GWfFOgIuDI1HVJrx5R+qIaOq729PBKE4RoVXYvGc46U7aq1zXACuga9V8KB9z7x3
 vq62r3jBNoX4yJ3vXVRLsjoC0a6C5RUaXBsmcaFG1Ah91T7S8h/ph4oqCxH35PxYgY9a
 o/VISUzZrPMwBuFsd8U531FVez2naDYnIQyxXh+ChsemTBbqkH6mm19QKRpsBNv60iOz
 aQVr2nQ7xQ4jKiVXU7yaajlF71OUERkTzBg1UkWWJJ3wUrt0Hs/mzPvp1TYHzObOVHci
 JH5pPWPEHg0i6kyoEza1oXR1LhboBhX7w06z6+oSskRi71pB02Bjgqi1F5ZiadrC0gjJ
 ySQg==
X-Gm-Message-State: AOAM531v6f21eS2DnlWHhorfz++KqXGGDthyiAeNAh+IikAa5k+FcD90
 H3EFCXnEyEhYCrbIQHirlwyUYa2Hi9jG6x/lEnc=
X-Google-Smtp-Source: ABdhPJwVDDyYVw4Io0KH35UAmJO9EKYGxMjIo0wIilyBuzKZnm2/5qdkjzgD2wCfDJHOeTCP8RnPfZSlsEgmR0kfnzk=
X-Received: by 2002:a25:5956:: with SMTP id n83mr1398479ybb.109.1630898785219; 
 Sun, 05 Sep 2021 20:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
 <CAEUhbmUvb4_tmevGEcK_YgyA9_g5LumRVpMc7+rwuD4D7FSBBA@mail.gmail.com>
 <a61c6fef-4bce-0c5b-7aff-b9e2fa75aa5b@c-sky.com>
 <CAEUhbmXULr_mcdfh6x=BGLNcNM5Q7YrFhnHOuLatbrokqP0Taw@mail.gmail.com>
 <e5f5e2b1-8fc5-31de-c927-1ae7545957f8@c-sky.com>
 <CAEUhbmVCYZ2j6Vp0g4JjHf5XmTDFW+wm5PoT4MmMjUvrfGpkeA@mail.gmail.com>
 <fbbf6698-5145-eab9-e3c9-66c9fe1598a1@c-sky.com>
In-Reply-To: <fbbf6698-5145-eab9-e3c9-66c9fe1598a1@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Sep 2021 11:26:14 +0800
Message-ID: <CAEUhbmUGav+UCx4_0azZFEq21h5V-q16Ca1nhK5Azbv++8gSJQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix satp write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 06 Sep 2021 03:26:29 -0000

On Mon, Sep 6, 2021 at 11:23 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2021/9/2 =E4=B8=8A=E5=8D=8810:47, Bin Meng wrote:
> > On Thu, Sep 2, 2021 at 10:44 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote=
:
> >>
> >> On 2021/9/2 =E4=B8=8A=E5=8D=889:59, Bin Meng wrote:
> >>> On Thu, Sep 2, 2021 at 9:02 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrot=
e:
> >>>> On 2021/9/1 =E4=B8=8B=E5=8D=889:05, Bin Meng wrote:
> >>>>> On Wed, Sep 1, 2021 at 8:51 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wr=
ote:
> >>>>>> These variables should be target_ulong. If truncated to int,
> >>>>>> the bool conditions they indicate will be wrong.
> >>>>>>
> >>>>>> As satp is very important for Linux, this bug almost fails every b=
oot.
> >>>>> Could you please describe which Linux configuration is broken?
> >>>> I use the image from:
> >>>>
> >>>> https://gitlab.com/c-sky/buildroot/-/jobs/1251564514/artifacts/brows=
e/output/images/
> >>>>
> >>>>>     I have
> >>>>> a 64-bit 5.10 kernel and it boots fine.
> >>>> The login is mostly OK for me. But the busybox can't run properly.
> >>> Which kernel version is this?
> >> 5.10.4
> >>> Could you please investigate and
> >>> indicate in the commit message?
> >>>
> >>> I just tested current qemu-system-riscv64 can boot to Ubuntu 20.04
> >>> distro user space.
> >> Very strange.  This will cause tlb_flush can't be called in this funct=
ion.
> >>
> > Did your kernel enable asid?
>
> Yes. Is it matter?

Not sure, the tbl_flush is on the ASID path. I suspect the kernel we
(Alistair and me) tested did not enable ASID.

Regards,
Bin

