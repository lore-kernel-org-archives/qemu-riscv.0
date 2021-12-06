Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muDgp-0003Py-8l
	for mharc-qemu-riscv@gnu.org; Mon, 06 Dec 2021 08:05:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muDgh-0003Mt-18
 for qemu-riscv@nongnu.org; Mon, 06 Dec 2021 08:05:49 -0500
Received: from [2a00:1450:4864:20::436] (port=42639
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muDgZ-0003rU-Ky
 for qemu-riscv@nongnu.org; Mon, 06 Dec 2021 08:05:41 -0500
Received: by mail-wr1-x436.google.com with SMTP id c4so22234618wrd.9
 for <qemu-riscv@nongnu.org>; Mon, 06 Dec 2021 05:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ckJNZsLUMwWAVsatr+RjA1hYlAJHfRzdTmJp4RO5KTY=;
 b=nPmpK2+4bOv2T65si+jTzA9yKIBVqm6iB7HSI7MfxLQY9DCuN6Xx4l4+0/Y56wUVOz
 xwoHS0x5ZI/2spK6GZ4y5009sHTAHzxoM98L0/9vzttC/6gNmkYQuWXLBBbvYkG6uvmf
 9Vz5H+eY9bsVp0y0e9mGKkYeX8P3opqTngWfiuBIQliY0CXpiv+3RaYFCUAj1rk8OwvG
 jcrhPOZcDjgUqFsejFkpU+AjOmmPXoMfXegzpxYjgv8OUFVFRus49tf3/Ccq+suAwoys
 OkGoP2PYjTB8ngmmZdK2rZitROiuxjQCGoBBCw6tYNqtgnEYlzJxBUu7s1xGHkdqrj4k
 RIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ckJNZsLUMwWAVsatr+RjA1hYlAJHfRzdTmJp4RO5KTY=;
 b=r2MVocXLW2ubxSy6ZxONP/CmqpSFAnpqRWPdAK6h00E5cFWItOWe0u3LljnApod3ow
 aVo9kZw5A0Vn6OpBOuXQ07lnNsgriLqPmJeTvrp7T29EDhzYhhb3woig5IrZVsapR/SA
 eI2PWr7nnByrPDhkcX3jzVB8sc8OjIC5ED+h8eayMfj2BrGY2VaGtrckvgKlaRHIFV5o
 GhSpaAeiFNegxqfyPe//pEWxk7r8uPHayc6uGEWSSbi8v0RwdYIrRcJ7Bobqzf05tPye
 IAYrnSvDakUVYOHeICml9mrlc98lfDYz7hT9Pj8Ga1F4SWQlctASD5aZzenjJxteEYVT
 jGUA==
X-Gm-Message-State: AOAM531Tl0Z1CmLGpy1r7WSUIe6NEVXGtUC7L+k7nwDYcQYyJMe/pTq3
 AiGOYtkSzcEh9/iXUmfP8TJBUGkJNgdqnM14C9IHMw==
X-Google-Smtp-Source: ABdhPJyD4HTHf/90WJvG9mmkq/txJjXFy2cVAv/rhTO9OmPGD4Ftkgqn0b35+rshQLUdYEVLlh7sy8nnOf2FE2dduKQ=
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr41228887wro.484.1638795937804; 
 Mon, 06 Dec 2021 05:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-2-armbru@redhat.com>
 <575fcf95-f4f0-3d88-ab08-b4d21f2da354@amsat.org>
 <87tufllxn5.fsf@dusky.pond.sub.org>
In-Reply-To: <87tufllxn5.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Dec 2021 13:05:26 +0000
Message-ID: <CAFEAcA9fBHgz+jbECRS6n5qqgKmrL=khseq-9cqsL7sDkqMXeA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 06 Dec 2021 13:05:50 -0000

On Mon, 6 Dec 2021 at 12:35, Markus Armbruster <armbru@redhat.com> wrote:
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
> > I guess a already asked this once but don't remember now... What is the
> > point of creating a SD card without drive? Is this due to the old desig=
n
> > issue we hotplug the drive to the SD card and not the SD card on the SD
> > bus?
>
> Device model "sd-card" implements BlockdevOps method change_media_cb().
> This menas it models a device with a removable medium.  No drive behaves
> like no medium.  I guess it's an SD card reader.

No, device sd-card really is the SD card -- the protocol between
the SD controller device and the sd-card device is (a slightly
abstracted version of) the protocol that goes between the card
and the controller in hardware. I think the reason it's implemented
as a "device with a removable medium" is historical -- back in
2007 that was the only way to support runtime ejecting and
insertion. We'd implement it differently today, but we've wanted
to preserve the user-facing compatibility of how the monitor
commands for ejecting and inserting an sd card work.

(Side note, the initial sd implementation actually tells the block
layer that it's BDRV_TYPE_FLOPPY as a "reasonable approximation"...)

-- PMM

