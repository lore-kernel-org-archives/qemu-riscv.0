Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBXgh-0000cI-Kl
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 03:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBXgf-0000bo-St; Thu, 05 Aug 2021 03:21:05 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBXgc-00049K-NW; Thu, 05 Aug 2021 03:21:05 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id c137so7260341ybf.5;
 Thu, 05 Aug 2021 00:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i7Vil66YHPO9qPvZHVcWlCr7ThezLJiFeSAfRfXL9eQ=;
 b=pjLbjGo/zQTIJdVMaMrXh3NJMFxq52TXfxsZamctXKy7jfc75ZTnhndsBtHxGJHP1r
 hFPtFt6vVxmitVBKdtsh/G197YIYfJMP/yzXfxh6mOFvTQGiQqcDdi7d/Jp9H8Ls1PeL
 qIy/da23ynlzkJhoh32VX4qs4ix3Clor0FUxxAg1h3kQiTuKZOAsetZt7zMuQp5VErkp
 iQFT6e8T5UTuN4A1bK5yK9GQ0nqkh6z1M//5r3HM01CM12U1UNeIlcQGA5TXgHo8vEE4
 lQ0cUcJxk2T0ClZ1DeDkhojSlbWpCua49MStir5ii+zbnwvfzz92AHI6sBDo599t1KyI
 mELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i7Vil66YHPO9qPvZHVcWlCr7ThezLJiFeSAfRfXL9eQ=;
 b=dGC0CeUqD12veBpZYY1pFGu1kxpCeDy45Z2Fltpnj6mwuqlfkyT+tUu6yxy+eI0p7M
 8t41hKP+JPizhJ3EqI5IIgWququyHk5TFSNt1mnMnVrJsAIGt56yPjjxf8LEyW3efZ4O
 cFVlnGhOkYwhOa60lLiojud7bUnLH6FIMv+fJ0rM1hKlssnR7zmxjB24nontKYp9ZeNm
 z2PNEJrXJegIOzvpb9p0wfisqmGUJ3YBBM2Nl4BdQUCze/HgWoAZ9k1LsY7BgDWyQrfo
 +QOyhgxzqZ8H2Our1rfHgxYf7OXBfJo0g+WKmF0N49Mb3Lc9yuUK19LWcwXcmpX4MkCY
 xd4A==
X-Gm-Message-State: AOAM530fWCCqS4U9sB0q9FDVaZvGdmoso40GmqezcugjOMvtB3UVhxLs
 XDx/2K9VVE6h+t4m9hlq6xbwYHWusbzeUL910YI=
X-Google-Smtp-Source: ABdhPJwG9uzjvUWfPSXVAvC+QxOipxzW9mfVCbkgMbCRFanudBxvATzkWNknMIYHq/X44q792Fu57qMvWyLb3MXP3iw=
X-Received: by 2002:a5b:304:: with SMTP id j4mr4219057ybp.314.1628148061076;
 Thu, 05 Aug 2021 00:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <CAKmqyKOCRXbEhZrZSQN-X2ObrX=_aoxgyCsevE05LY9S-TS4hQ@mail.gmail.com>
 <a404e8dd-eb20-4d4a-6aa0-7c444b46c706@c-sky.com>
In-Reply-To: <a404e8dd-eb20-4d4a-6aa0-7c444b46c706@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 5 Aug 2021 15:20:50 +0800
Message-ID: <CAEUhbmU0TVvMvUi52kBYNJR0zjpoBmR6+3-PjOUu2r+6HL5qaA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Support UXL field in mstatus
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
X-List-Received-Date: Thu, 05 Aug 2021 07:21:06 -0000

On Thu, Aug 5, 2021 at 3:16 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2021/8/5 =E4=B8=8B=E5=8D=882:01, Alistair Francis wrote:
> > On Thu, Aug 5, 2021 at 12:55 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote=
:
> >> This patch set implements UXL field in mstatus register. Programmer ca=
n change
> >> UXLEN by writting to this field. So that you can run a 32 bit program
> >> on a 64 bit CPU.
> > Awesome! Do you have any steps for building a rootFS to test this?
>
> Not yet.  It depends on Linux support which  will not start until
> October.  Maybe as a rough test,
> we can run the 32 glibc test cases on qemu-riscv64 with an option
> uxl32=3Dtrue(not implement yet).

That's my understanding as well. Currently there is no software stack
that supports mode switch, e.g.: OpenSBI boots in 64-bit but loading a
32-bit payload to execute.

Do you plan to support SXL as well?

Regards,
Bin

