Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqc4I-0005hk-TM
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 07:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51596)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqc4E-0005Nz-Eb
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:37:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqc4C-0003i2-GO
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:37:49 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36751)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqc4A-0003eL-Ic
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 07:37:48 -0400
Received: by mail-wm1-f65.google.com with SMTP id g67so40323275wme.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Jul 2019 04:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uogSuPxOvtyP+/Y5rYXbgayF1NJ8ysZQzPcvLa/aI8U=;
 b=JCZqSZhVaHX7ZEAlqPqOLB9qOUigDLgtEBKet+sQOpVmPAWzno0McZCECbs6CiF+Va
 ObhSSgNbpzzOzKkY5yM5w/O03m38EM+ftW3omcAflQa9iD1kMlydQX7xFfM9QJcZ5PpH
 G9iOKJ0hIlQkBZONKzUuNNNrDSE7oBip3hHEqwmRTlVKE/EQpWkBaB6CJ4RLyriqT6lm
 2BzKA7O/L5cIa0dNJXn32agDRBw2Ut4mF8CxgQveNa6vos4txDcgEA6xwxbVxT5YQE3i
 Tx/sEvMheyaoj8T1xcBF/hwvxeIQjEpoLmlH4L2V6Fv4es63dK1sx+72VQNcY1PIdBOn
 2cBw==
X-Gm-Message-State: APjAAAUi+jQ0Ufb6l2Az35TQkZme3t+6M6OWxjaKHRe4SXbx6a7Pk8t/
 FQaFxSS+FCg52bER+3/tu/X7Vw==
X-Google-Smtp-Source: APXvYqzkNxt0eN2pEaKu9QFkxJQ9Nf+eAiM5gW5xYUVZx69HvaBA5o4Hhf1Pa9ZT4U0JH+jAwWXE+g==
X-Received: by 2002:a1c:b706:: with SMTP id h6mr77262146wmf.119.1564054665429; 
 Thu, 25 Jul 2019 04:37:45 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id g19sm90017297wrb.52.2019.07.25.04.37.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:37:44 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, walling@linux.ibm.com,
 sagark@eecs.berkeley.edu, david@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, Alistair.Francis@wdc.com,
 edgar.iglesias@gmail.com, arikalo@wavecomp.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, shorne@gmail.com, david@gibson.dropbear.id.au,
 qemu-riscv@nongnu.org, kbastian@mail.uni-paderborn.de, cohuck@redhat.com,
 alex.williamson@redhat.com, qemu-ppc@nongnu.org, amarkovic@wavecomp.com,
 pbonzini@redhat.com, aurelien@aurel32.net
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048377976.39897@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a40b6144-3f18-f42e-25da-8c2ec7ad6da6@redhat.com>
Date: Thu, 25 Jul 2019 13:37:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048377976.39897@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 03/15] target/mips: Access
 MemoryRegion with MemOp
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
X-List-Received-Date: Thu, 25 Jul 2019 11:37:53 -0000

On 7/25/19 11:52 AM, tony.nguyen@bt.com wrote:

<no description>

I think Aleksandar will ask you to describe what the MemOp does, you can
add something like:

  The MEMOP_SIZE() macro will allow us to later easily convert the
  memory_region_dispatch_ACCESS() functions to ...
  Meanwhile this macro is a no-op. Thus this patch does not introduce
  any logical change.

And you can reuse this blob in the other patches around.

With an improved patch description:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  target/mips/op_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
> index 9e2e02f..dccb8df 100644
> --- a/target/mips/op_helper.c
> +++ b/target/mips/op_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/helper-proto.h"
>  #include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
> +#include "exec/memop.h"
>  #include "sysemu/kvm.h"
> 
>  /*****************************************************************************/
> @@ -4740,11 +4741,11 @@ void helper_cache(CPUMIPSState *env, target_ulong addr, uint32_t op)
>      if (op == 9) {
>          /* Index Store Tag */
>          memory_region_dispatch_write(env->itc_tag, index, env->CP0_TagLo,
> -                                     8, MEMTXATTRS_UNSPECIFIED);
> +                                     SIZE_MEMOP(8), MEMTXATTRS_UNSPECIFIED);
>      } else if (op == 5) {
>          /* Index Load Tag */
>          memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
> -                                    8, MEMTXATTRS_UNSPECIFIED);
> +                                    SIZE_MEMOP(8), MEMTXATTRS_UNSPECIFIED);
>      }
>  #endif
>  }
> --
> 1.8.3.1
> 
> 
> 

