Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hxWV3-00086t-Ue
	for mharc-qemu-riscv@gnu.org; Tue, 13 Aug 2019 09:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56648)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hxWV1-00086K-Gl
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 09:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hxWV0-0003tr-IF
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 09:06:03 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hxWV0-0003tN-CI
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 09:06:02 -0400
Received: by mail-wm1-f67.google.com with SMTP id z23so1390649wmf.2
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2019 06:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=er5CioLV9Yb8Z57pbegotoK7UGycsPbrWboLu8pnWhM=;
 b=dJJVbLk/UO7rmTLLGo7ZwUhqS/E3sFRMhZOD+WTJQ4fw2OqBCnal+Lkuwyo5iKHVC5
 F7Ig/KROWvUTH0SijUXKWmQenZrBcqlHdHQiL/2xHW89lAHpMWSJyUcN6o302WUFcKS6
 zEqSRC/OUUUarVQkXR6qBfAf9YAuCE1HbEuBmoPOWEKjQZsA7aWL3Pg4F/+8BWIprWA/
 TWzrvo/bYWQfoOMLHiNBKlUZ4TR11cAGGD8go6xRA+v82Q4YxQlmNvj1+wtfKterAiDq
 oWz8ty4mGfiCWOQ2MXSBIkW88Ra8FbVbUppfU3m1oMimR4YsB0ohhx3jETS9VqcyInq4
 d/Ag==
X-Gm-Message-State: APjAAAXyOBR5AHkG8znbbyuqsWv1EfSJJa45DsKAz2DS3feTdQPlnujR
 NZcjGoCO3QnayVDlqroUMbFl0g==
X-Google-Smtp-Source: APXvYqxn2GluI0c3s2caziqTikBNQrjY9hggMlf/XivWjoD0Pn4dOTQHXhc/HpCsrr2pI7rdFMbZAQ==
X-Received: by 2002:a1c:f914:: with SMTP id x20mr3209934wmh.142.1565701561172; 
 Tue, 13 Aug 2019 06:06:01 -0700 (PDT)
Received: from [192.168.1.35] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id i66sm2325328wmi.11.2019.08.13.06.05.59
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 06:06:00 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>, armbru@redhat.com,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20190813124946.25322-1-alex.bennee@linaro.org>
 <20190813124946.25322-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f60d8934-f6b1-7619-dc2a-062cc769fbfc@redhat.com>
Date: Tue, 13 Aug 2019 15:05:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190813124946.25322-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 12/13] target/riscv:
 rationalise softfloat includes
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
X-List-Received-Date: Tue, 13 Aug 2019 13:06:04 -0000

On 8/13/19 2:49 PM, Alex Bennée wrote:
> We should avoid including the whole of softfloat headers in cpu.h and
> explicitly include it only where we will be calling softfloat
> functions. We can use the -types.h and -helpers.h in cpu.h for the few
> bits that are global.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/riscv/cpu.c        | 1 +
>  target/riscv/cpu.h        | 2 +-
>  target/riscv/fpu_helper.c | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f8d07bd20ad..6d52f97d7c3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -27,6 +27,7 @@
>  #include "qemu/error-report.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
> +#include "fpu/softfloat-helpers.h"
>  
>  /* RISC-V CPU definitions */
>  
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0adb307f329..240b31e2ebb 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -22,7 +22,7 @@
>  
>  #include "qom/cpu.h"
>  #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat-types.h"
>  
>  #define TCG_GUEST_DEFAULT_MO 0
>  
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index b4f818a6465..0b79562a690 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -21,6 +21,7 @@
>  #include "qemu/host-utils.h"
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
> +#include "fpu/softfloat.h"
>  
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env)
>  {
> 

