Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEQGX-0003cC-5M
	for mharc-qemu-riscv@gnu.org; Mon, 31 Jan 2022 01:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEQGV-0003c0-DF; Mon, 31 Jan 2022 01:34:15 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=37482
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEQGS-00082u-FC; Mon, 31 Jan 2022 01:34:13 -0500
Received: by mail-io1-xd2f.google.com with SMTP id n17so15445703iod.4;
 Sun, 30 Jan 2022 22:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FQRGwxcjhZ7j5jntoCET/NSCqSVLiRF+K8hs9vX7USc=;
 b=RqN4PtxC2RY1BpoikVMCbsw3BAkGTa40xwEDq8VGg1CYZY0wAISSri6lUgpVc6U1Dj
 KcivoWVdGWCTkNvCyaURC1kx3Pg9u6qCsSN3oDt0lbjE8MTi+g+sC/I41s2527HJOuQC
 Esek1MxKzyjuxqh7Cl7y9HwuBbsilnZw6AlZ+3NBibBCE3EVIvaMcW7D5/lvxwHj+XNj
 jVnmhXn0c2fnI8AiGlTrSxLhSkdyBqNG+gMahys02D/En6xwrrTW73mvznykNuq08o8o
 SBCvxH0r4wN2f/w0BRZIWxsP7VwO2de5O1xJ+kwvlV8KQ4/3UJK/xGkgKZ7TUGRFp1rA
 ghfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FQRGwxcjhZ7j5jntoCET/NSCqSVLiRF+K8hs9vX7USc=;
 b=owOYUuwYW5tWpVVqasxDhZMu/fnOfq/lrvCp6g49KfLReWNIHziGOIdswhkm5HjL7X
 M/U2ZiVvNMmmW2SKpqidYphojClCAWlZn5COSAqtUaWNWbZNhNhfIY63mFrb9isa7c6T
 npWIJxsDLesg7re/tW0g4iVcO7is1TTUVRTiW9l58TUGoYx1vSX9M5q1CvL+lIiTA/JJ
 yvxxAOpY7XhiaylKO/IwbOwU/aMDxrePkYiBQmpPScOK174AAGt5dVZLkBSSZOEiNf/d
 HcrRBOmtopb++SF7phlV8hAtvgVu6XBEiLXtUBmDZbnY1Q0efFrjaL1Vow0t0hg5Mh6j
 MrRA==
X-Gm-Message-State: AOAM5306F/6YnFQ5YR9a5v8XBiljrGVbjxG5Z77PXFXWpmeD/e4hiula
 KM1/AtzW906IywuplFALo8ZsVOIBi4nwuaukIeI=
X-Google-Smtp-Source: ABdhPJzYa0iAdRdi+9xE79Pn/JDw7WOX7XrlbpgLfIocAaVJW8opXyi8am5LFQIXLCpUT3hNvNxg8tj9k2aOQxwb3fQ=
X-Received: by 2002:a02:c956:: with SMTP id u22mr9751007jao.63.1643610850581; 
 Sun, 30 Jan 2022 22:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-2-atishp@rivosinc.com>
 <fc833a66-c0fe-931a-ab7e-e81917a8d786@linaro.org>
 <CAHBxVyGOuLWPs1-10GTAtz6=QMDybOq4h5dXLq7NcDYOTn9nuA@mail.gmail.com>
In-Reply-To: <CAHBxVyGOuLWPs1-10GTAtz6=QMDybOq4h5dXLq7NcDYOTn9nuA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 31 Jan 2022 16:33:44 +1000
Message-ID: <CAKmqyKOG69wcrL0z8MMtjiyLjGrfwTx-mLM-KsSuMfWXZjCjkg@mail.gmail.com>
Subject: Re: [RFC 1/5] target/riscv: Add the privileged spec version 1.12.0
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 31 Jan 2022 06:34:15 -0000

On Sat, Jan 29, 2022 at 10:57 AM Atish Kumar Patra <atishp@rivosinc.com> wrote:
>
>
>
> On Sun, Jan 23, 2022 at 11:59 PM Richard Henderson <richard.henderson@linaro.org> wrote:
>>
>> On 1/21/22 7:07 AM, Atish Patra wrote:
>> > Add the definition for ratified privileged specification version v1.12
>> >
>> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> > ---
>> >   target/riscv/cpu.h | 1 +
>> >   1 file changed, 1 insertion(+)
>> >
>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> > index 4d630867650a..671f65100b1a 100644
>> > --- a/target/riscv/cpu.h
>> > +++ b/target/riscv/cpu.h
>> > @@ -82,6 +82,7 @@ enum {
>> >
>> >   #define PRIV_VERSION_1_10_0 0x00011000
>> >   #define PRIV_VERSION_1_11_0 0x00011100
>> > +#define PRIV_VERSION_1_12_0 0x00011200
>>
>> Is there any good reason for defining things this way, as opposed to a simple enumeration?
>> A simple enum would eliminate the need for
>>
>
> Agreed. A simple enum would be much nicer. I was just following the previous definition of
> PRIV_VERSION_1_10_0 & PRIV_VERSION_1_11_0.
>
> I am not sure about the reason behind this scheme.
>
> @Alistair Francis Is there any history behind this scheme ?

I don't think so

> or Are you okay if I change it ?

Yep :)

Alistair

