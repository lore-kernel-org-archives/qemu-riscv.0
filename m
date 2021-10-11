Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ma4jB-0006SA-JX
	for mharc-qemu-riscv@gnu.org; Mon, 11 Oct 2021 19:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ma4j6-0006PT-1i; Mon, 11 Oct 2021 19:29:03 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:37670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ma4j4-0001nu-K3; Mon, 11 Oct 2021 19:28:59 -0400
Received: by mail-io1-xd2c.google.com with SMTP id m20so20829407iol.4;
 Mon, 11 Oct 2021 16:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1RYcOh4vJUJJAbfFhy7OmWtrAK3xo+ZkiQ1/yMeYbmA=;
 b=KqotBDuUM/irgOpPPPeuRo+Qd2Dp624OYSY0x1p5kSI+yLpDt1inkmrjBsqTm1sdsR
 1yUAcUju98KxOFenHC6NXKqDyFSqqOSiXb3iAz4ew1/DFgE0RIfuixyxWmv6GtxQjAYf
 vIRJAVuB5X3zaRlveg4n/7caqcqVYsCy14S+Qd+JTOpIX7vllXBFU+C6Xn0BM6nvy6MD
 YC8gPSnuZJ8355iGo/YJwlcnjP9R8xSZzRNnjFr95LepL0l598bdfsj+mm9LxO4o+Gyj
 JVjbHocAFRUgCaVs2ZRon7+NdvAW4a/rXbQy0u1IQkibWFnVVEajkajhXoGkrgdjW9Ob
 bANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1RYcOh4vJUJJAbfFhy7OmWtrAK3xo+ZkiQ1/yMeYbmA=;
 b=zXNdNx3M2B29UJAdDZO4FzIu+9Gcam8yHq4lGkGvH6XfCxvI/PHIO3zZm6uC4WTReM
 PLkaYXiZadISLVdtX5h+Hh9SZoZyZyQGh+WIbO9KIG9atZPH+2I21ebuGgEtjceayE0s
 aM8okIO6jS7QqtXKbN8IN3F2jtQMeI/tYyO7RsVDQ4gmf+wjz4IA7g4vhcD5LeXrQFaI
 +sIcMSw1jpTaAuq7zZgZIxus3MdZ/xW8uD5peKRMoke2rdve6pM5df2zlTYcatpYOiB2
 dZCRPZfGwca5tw9Ka43M/Ci3v+lykGl4zYErTk0K1MRuOROTb0DczmNcctTP9gQs7diJ
 0BPg==
X-Gm-Message-State: AOAM532doY+hLgkqhRFba9cdLpubNQBnA5hmcwfDL2DVllGvThraFkW2
 GlaBCm2t3HpYwJEbT//qIshn/1iAgP9WIixov/g=
X-Google-Smtp-Source: ABdhPJz8FS4tuuu0FcpsTfci4cT6tcHfg+iQP0kkSpuQFLU+2WmICun3TQTDxUZiz3twoCd/3oTuNOLY6OkKT4bzpyI=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr20897516ioq.57.1633994937245; 
 Mon, 11 Oct 2021 16:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-3-richard.henderson@linaro.org>
In-Reply-To: <20211007174722.929993-3-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Oct 2021 09:28:31 +1000
Message-ID: <CAKmqyKPw0J63USaG0E=95+v8GkoBGVq3r0Oh3A1Zw4hELe6c9w@mail.gmail.com>
Subject: Re: [PATCH 02/13] target/riscv: Create RISCVMXL enumeration
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Mon, 11 Oct 2021 23:29:03 -0000

On Fri, Oct 8, 2021 at 3:47 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the MXL_RV* defines to enumerators.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 999187a9ee..e248c6bf6d 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -364,9 +364,11 @@
>  #define MISA32_MXL          0xC0000000
>  #define MISA64_MXL          0xC000000000000000ULL
>
> -#define MXL_RV32            1
> -#define MXL_RV64            2
> -#define MXL_RV128           3
> +typedef enum {
> +    MXL_RV32  = 1,
> +    MXL_RV64  = 2,
> +    MXL_RV128 = 3,
> +} RISCVMXL;
>
>  /* sstatus CSR bits */
>  #define SSTATUS_UIE         0x00000001
> --
> 2.25.1
>
>

