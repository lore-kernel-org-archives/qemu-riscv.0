Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWcbi-0008M8-Gp
	for mharc-qemu-riscv@gnu.org; Mon, 18 Nov 2019 03:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iWcbf-0008KK-A1
 for qemu-riscv@nongnu.org; Mon, 18 Nov 2019 03:42:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iWcbe-0007eD-3j
 for qemu-riscv@nongnu.org; Mon, 18 Nov 2019 03:41:59 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iWcbd-0007dG-OY
 for qemu-riscv@nongnu.org; Mon, 18 Nov 2019 03:41:58 -0500
Received: by mail-wr1-x442.google.com with SMTP id b18so16900021wrj.8
 for <qemu-riscv@nongnu.org>; Mon, 18 Nov 2019 00:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CzM2VI0idBWgtiGfAq6Zv0yTI6qF2bsxDrGTUD/vAro=;
 b=oBadPYevT8fKQqJiBXlA+INjxrVybiuIDrugYv/ONDJ+JbfoICu4QeTyRCgK+GCF7T
 lshDcOitjr3ztkHPv2Ea45wHG1/WUVS2YGppovKprk+76ESftDM+pYSPS7EUzdwOAuGd
 oDdyjeiA8yf2c4Vpbin6n4ivAK8A+IcflRkftt0Bt3+n0zgQOFPiSSVjjOWIjqJQaP55
 8DIJZ5gOp+6lHyk1QzmmzflzgkaSAFSRm+kGIAizd6qkM6w0m+OMIKlpFCblYyKtWuuX
 JtMclux1vjxw/F0htyFiTdpvhTf4w3wR+WGd5eejNJkJTMUeY5vwZJ2PWpvCSV+ZxccY
 Z7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CzM2VI0idBWgtiGfAq6Zv0yTI6qF2bsxDrGTUD/vAro=;
 b=IlO06Pqo5VsO5lM0cUz4LiY+q4oN9FU7Rdgqn4N99t5OFwZ6DZ5ks3oT6u7oru+HV6
 HxibOkgGJhvcUfSQXbrrz8eoRjpQwbV65CehXs9LaidaBubrrW+HA91WZe9F5HAmUwR5
 JoNFUXd8KvWEk4Na1AX6cZ5fgaE71z6toOFoIAn7UR/dEqnICuy9drI4H3lUvqa73zRr
 0MjvT478n6KatyMnlfM9GHJD65Cn4hInjbZDPXvAwMsM9nF/ZIwTkGJm9iGMRvPW4nJH
 60U5apEA7Miw8TK/MPJfrWxnn9g7HGORELm0OeT/G3jnMbBD5JdSolTQiCU/BqddoVeY
 JLJA==
X-Gm-Message-State: APjAAAWV1aHji6rBnc5btMH8oZpckeuycMrn3Yug3N71Dg5oNtOqFuJZ
 ynUMGyZsZsDaLXzNp1mLI7/qzA==
X-Google-Smtp-Source: APXvYqwfuXWhOQ/+Ftbt4HEkYyX+Qk+RemfsHItJbleagb0H94bb64znOuJRgW3bPyWYv9uDdUlKyw==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr30535284wrm.199.1574066516544; 
 Mon, 18 Nov 2019 00:41:56 -0800 (PST)
Received: from [192.168.8.102] (65.red-79-149-41.dynamicip.rima-tde.net.
 [79.149.41.65])
 by smtp.gmail.com with ESMTPSA id n23sm19237841wmc.18.2019.11.18.00.41.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 00:41:55 -0800 (PST)
Subject: Re: [RFC PATCH 08/11] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20191115173000.21891-1-alex.bennee@linaro.org>
 <20191115173000.21891-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <026f7fc7-082c-c277-bbfa-f51eb0c058c4@linaro.org>
Date: Mon, 18 Nov 2019 09:41:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115173000.21891-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
X-List-Received-Date: Mon, 18 Nov 2019 08:42:00 -0000

On 11/15/19 6:29 PM, Alex Bennée wrote:
> +++ b/target/arm/helper.c
> @@ -47,30 +47,27 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>  
>  static void switch_mode(CPUARMState *env, int mode);
>  
> -static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
> +static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
>  {
>      int nregs;
>  
>      /* VFP data registers are always little-endian.  */
>      nregs = arm_feature(env, ARM_FEATURE_VFP3) ? 32 : 16;
>      if (reg < nregs) {
> -        stq_le_p(buf, *aa32_vfp_dreg(env, reg));
> -        return 8;
> +        return gdb_get_reg64(buf, *aa32_vfp_dreg(env, reg));
>      }
>      if (arm_feature(env, ARM_FEATURE_NEON)) {
>          /* Aliases for Q regs.  */
>          nregs += 16;
>          if (reg < nregs) {
>              uint64_t *q = aa32_vfp_qreg(env, reg - 32);
> -            stq_le_p(buf, q[0]);
> -            stq_le_p(buf + 8, q[1]);
> -            return 16;
> +            return gdb_get_reg128(buf, q[0], q[1]);
>          }

Mostly ok, except for this change, which has the same endianness problem that
the other ARM change did.  Why is this not done in patch 6 with the other?


r~

