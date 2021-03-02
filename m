Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGzYV-00042k-L0
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 02:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGzYT-00041H-HN; Tue, 02 Mar 2021 02:34:53 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGzYS-0002Tm-17; Tue, 02 Mar 2021 02:34:53 -0500
Received: by mail-ed1-x531.google.com with SMTP id w9so7810140edt.13;
 Mon, 01 Mar 2021 23:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wl2JGoMMJODUvmMIhM5DOdWmasryZQUK2/CawkeGpFo=;
 b=AEoo8iXdyVr3PJJJu+hLrDA5Sb+YxFGhrhBHbcWAXENT2lb6CD5v31uWvpjqK2vNJl
 tvaiEC08rEE1g5sNbce+oztO+kB+PJiqRzZLXGH2Iob8nSkEkVD7ajb4LoyumyIt3b7s
 Ik333nrkxhtKINPra+lI8dY8Yb9EA8Fe2lw5nVN2+pJtuije/V/yp+eFo+m5dCUjtadr
 TBC4eZ+c9l1GU4NOZjrghQwk0ovvagVcyMmCShfLNTtksuGu6WJ7mnmZ2NVkTiTELIuQ
 e+ujWcDsMgzcZrmV8hUKnSDIaxLYfNEEvMIkEMoKhjQ4TiJLk19qihz8PCSB7lGUAk10
 wImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wl2JGoMMJODUvmMIhM5DOdWmasryZQUK2/CawkeGpFo=;
 b=Qpbo5cH2GLfvzcPhINXIEOFg0s5xRcnO0Gzzhn/ED2TZLW7YAsN/rnmM/DQ7mZltPo
 pgFdgDdWM8/Yw72LwFsNFjX9tV0wzOOD9PKwNFK53XNe/3LzTIV4VkUHwuvjvNkeB/Mq
 QDXfQ+C4QqUEsaC87fntiu2WJ46aGgh7Fldshpue25kBSV5yWqkTX+doD/Ho9gT7PYfH
 zoUZDdJw3+OcBWlTHkjxENqCGC110ZVQs0jHxD2iQigL12dASpTxNyq8C/QAKEvjTNir
 6u0UWZzFIYoTqaSRwQbzvGeSzn/AndND5WRCm1BEf1eObY2BdRtDt41EsBdBkSYweJip
 w/0A==
X-Gm-Message-State: AOAM532ITrCxoKIKhTXKqrQ2QUd7Dyvzq2wwocP7eyr08x+pXn6/1ROY
 rOjwo8BA8DLYIttej6gf65c=
X-Google-Smtp-Source: ABdhPJynhvKxyf67nD2ccZt4ImkttuDLeOP0pcTO9f3bTRMZW6cpj6W0zJNpITvSphi/2hMkMGf7yA==
X-Received: by 2002:a50:bc15:: with SMTP id j21mr19375414edh.187.1614670487762; 
 Mon, 01 Mar 2021 23:34:47 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ga5sm16785171ejb.114.2021.03.01.23.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 23:34:47 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC PATCH v2 17/17] cpu: Restrict "hw/core/sysemu-cpu-ops.h" to
 target/cpu.c
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210301215110.772346-1-f4bug@amsat.org>
 <20210301215110.772346-18-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <346469ee-3b89-1b0c-6304-4e765c64fa50@amsat.org>
Date: Tue, 2 Mar 2021 08:34:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301215110.772346-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 02 Mar 2021 07:34:53 -0000

On 3/1/21 10:51 PM, Philippe Mathieu-Daudé wrote:
> Somehow similar to commit 78271684719 ("cpu: tcg_ops: move to
> tcg-cpu-ops.h, keep a pointer in CPUClass"):
> 
> We cannot in principle make the SysEmu Operations field definitions
> conditional on CONFIG_SOFTMMU in code that is included by both
> common_ss and specific_ss modules.
> 
> Therefore, what we can do safely to restrict the SysEmu fields to
> system emulation builds, is to move all sysemu operations into a
> separate header file, which is only included by system-specific code.
> 
> This leaves just a NULL pointer in the cpu.h for the user-mode builds.
> 
> Inspired-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC: improve commit description?
> 
>  include/hw/core/cpu.h           | 3 ++-
>  cpu.c                           | 1 +
>  hw/core/cpu.c                   | 1 +
>  target/alpha/cpu.c              | 1 +
>  target/arm/cpu.c                | 1 +
>  target/avr/cpu.c                | 1 +
>  target/cris/cpu.c               | 1 +
>  target/hppa/cpu.c               | 1 +
>  target/i386/cpu.c               | 1 +
>  target/m68k/cpu.c               | 1 +
>  target/microblaze/cpu.c         | 1 +
>  target/mips/cpu.c               | 1 +
>  target/moxie/cpu.c              | 1 +
>  target/nios2/cpu.c              | 1 +
>  target/openrisc/cpu.c           | 1 +
>  target/riscv/cpu.c              | 1 +
>  target/rx/cpu.c                 | 1 +
>  target/s390x/cpu.c              | 1 +
>  target/sh4/cpu.c                | 1 +
>  target/sparc/cpu.c              | 1 +
>  target/tricore/cpu.c            | 1 +
>  target/xtensa/cpu.c             | 1 +
>  target/ppc/translate_init.c.inc | 1 +
>  23 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index d99d3c830dc..398696f0f2d 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -80,7 +80,8 @@ struct TCGCPUOps;
>  /* see accel-cpu.h */
>  struct AccelCPUClass;
>  
> -#include "hw/core/sysemu-cpu-ops.h"
> +/* see sysemu-cpu-ops.h */
> +struct SysemuCPUOps;

As the deprecated targets aren't built by default, I missed:

-- >8 --
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index c80cae9ff3b..eed7f3f440c 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
+#include "hw/core/sysemu-cpu-ops.h"


 static void lm32_cpu_set_pc(CPUState *cs, vaddr value)
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 610fb5393ae..afe106da2d4 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -17,6 +17,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
+#include "hw/core/sysemu-cpu-ops.h"

 static void uc32_cpu_set_pc(CPUState *cs, vaddr value)
 {
---

