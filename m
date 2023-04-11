Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm4wP-0005Af-6j
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 23:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pm4wN-0005AS-JK; Mon, 10 Apr 2023 23:45:07 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pm4wL-00024r-T1; Mon, 10 Apr 2023 23:45:07 -0400
Received: by mail-ej1-x632.google.com with SMTP id jg21so16667920ejc.2;
 Mon, 10 Apr 2023 20:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681184704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+evu/Hvh/xaKlvcrY+QmZIJH/JeZJjjYO0XhAaQvavo=;
 b=Xkn+F9hPn2OUXGze6zWix9bMqxHiYOWft54fjMA+KqvoG6Po0e6EBRq9Z90o3/GUyn
 7uTqhjQIvRHBTFFm5ifVT4pX3Y1V5+u48Lo2v0q+5ZrNxa42NaxGoa9xTRjthui7huM5
 HSU+6euK4xN3VNZwwku6Iu3U6d/872xBtIHii/49MEUR6OW1DiWJlp2yJf55Kb4kZXAS
 0K4XiDoHQjvoxrqw/7Qq9eDL3qix87jOilWL8soUw2+KV8KMv+lKegOYdeoYLrmQufHA
 SL6dE6Vr0GRpW5ekrrm4Pynd4pyQGN6/0h8s0LoYg3u+kyppHCWOXn6HJeb8ro3YzKGL
 FL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681184704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+evu/Hvh/xaKlvcrY+QmZIJH/JeZJjjYO0XhAaQvavo=;
 b=HDAWfwlfoC0s2uV+7jZ1e49wAGTutAXop8p5Gh3FQwFuUuT9OwzM5Vj5ezdIcEMw7W
 1+2hVl9jofTEYQKEgzsPMNZABo6PnGJC4QjSAuHI4IrWktGCeLmCapn5OtCpXtEwE9oA
 YSwvAGxriEiUiAtNazhwzc90BxvZ4wIT4XIRs8Yt/8e5mKL/Znu4SIYIbakESVP1KpAl
 tcXk1eNfM+8gJHCO51QrtJLMKQjyPsuEuog7OD9+/90Iq3l5jaq6Rt+/sFxPwwXnLAch
 Iag2PqVPpAxmVkK3lAb5g/OBoJJlXErs7vyY9/5paY9qG/z9Vt18H8gPGBfgcLMqIpRm
 eewQ==
X-Gm-Message-State: AAQBX9enFax8LyUtmvcgNPFUF44NgowNEXnLtZV5GpQws4IsnbqYJrms
 KSIhTAbAMhA5yK1UU1GaC0G2ZdXnEnParbWY7Hg=
X-Google-Smtp-Source: AKy350a+7QfVi1ZrP/1nLSDyjh0EOiRmN84Z80RIE5kJJWocytADlsGRexCF7q24/Jz7wns1zt3stBhdC1tt3iq2T3M=
X-Received: by 2002:a17:906:fa19:b0:94b:28ff:9e8d with SMTP id
 lo25-20020a170906fa1900b0094b28ff9e8dmr1754242ejb.9.1681184703654; Mon, 10
 Apr 2023 20:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <e9de7676-b669-4f4e-e3e0-e57fb58b7bd7@intel.com>
 <CAKmqyKO6n0go_SzsViGjuS_US8ewiWkNdnVSHwjHmZWUSajpow@mail.gmail.com>
In-Reply-To: <CAKmqyKO6n0go_SzsViGjuS_US8ewiWkNdnVSHwjHmZWUSajpow@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 11 Apr 2023 11:44:52 +0800
Message-ID: <CAEUhbmUiU=VzDNCdCKqLu5f9TxUubFE3PjJbZv+JWMm-70ndyQ@mail.gmail.com>
Subject: Re: riscv: g_assert for NULL predicate?
To: Alistair Francis <alistair23@gmail.com>
Cc: "Wu, Fei" <fei2.wu@intel.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, bmeng@tinylab.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 03:45:07 -0000

On Wed, Apr 5, 2023 at 2:07=E2=80=AFPM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Mon, Apr 3, 2023 at 11:43=E2=80=AFPM Wu, Fei <fei2.wu@intel.com> wrote=
:
> >
> > Recent commit 0ee342256af92 switches to g_assert() for the predicate()
> > NULL check from returning RISCV_EXCP_ILLEGAL_INST. Qemu doesn't have
> > predicate() for un-allocated CSRs, then a buggy userspace application
> > reads CSR such as 0x4 causes qemu to exit, I don't think it's expected.
>
> Hm.... That's not good. Userspace shouldn't be able to crash QEMU. I
> think we want to revert that patch then.
>
> @Bin Meng any thoughts?
>

Agree, I will send a patch for this.

Regards,
Bin

