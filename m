Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lG50S-000231-RI
	for mharc-qemu-riscv@gnu.org; Sat, 27 Feb 2021 14:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lG4fK-0001Uw-0v; Sat, 27 Feb 2021 13:50:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:46994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lG4fE-0007Cs-MT; Sat, 27 Feb 2021 13:50:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 539EEAC6F;
 Sat, 27 Feb 2021 18:50:00 +0000 (UTC)
Subject: Re: [PATCH 07/16] cpu: Introduce CPUSystemOperations structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-ppc@nongnu.org,
 Marek Vasut <marex@denx.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Michael Walle
 <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Laurent Vivier <laurent@vivier.eu>, Anthony Green <green@moxielogic.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Thomas Huth <thuth@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Greg Kurz <groug@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20210226163227.4097950-1-f4bug@amsat.org>
 <20210226163227.4097950-8-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <52e23664-534b-70b3-fad0-54a6b964963f@suse.de>
Date: Sat, 27 Feb 2021 19:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210226163227.4097950-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 27 Feb 2021 14:11:59 -0500
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
X-List-Received-Date: Sat, 27 Feb 2021 18:50:16 -0000

On 2/26/21 5:32 PM, Philippe Mathieu-Daudé wrote:
> Introduce a structure to hold handler specific to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/core/cpu.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index b12028c3c03..ab89235cb45 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -80,6 +80,12 @@ struct TCGCPUOps;
>  /* see accel-cpu.h */
>  struct AccelCPUClass;
>  
> +/*
> + * struct CPUSystemOperations: System operations specific to a CPU class
> + */
> +typedef struct CPUSystemOperations {

I'd suggest for consistency and brevity:

SysemuCPUOps .

Let me tell you my full train of thought, just so you understand exactly where I am coming from:

in my view all this camelcase is nonsense, as is typedef. They just cause problems and solve none.

However, considering the existing QEMU conventions, the existence of QOM,
for consistency with the rest of the QEMU code base, especially when looking at stuff around CPUClass,
the convention is to use this camel case stuff for objects, so in lieu of

tcg_cpu_ops

I went with TCGCPUOps

(TCG is the standard way to call tcg when case is an option, same for CPU, then Ops).

Here for consistency I would say:

Sysemu (as we are standardizing on calling system emulation/virtualization "sysemu")
+CPUOps as before.

=

SysemuCPUOps.

What do you think?

Ciao,

Claudio

> +} CPUSystemOperations;
> +
>  /**
>   * CPUClass:
>   * @class_by_name: Callback to map -cpu command line model name to an
> @@ -190,6 +196,9 @@ struct CPUClass {
>      bool gdb_stop_before_watchpoint;
>      struct AccelCPUClass *accel_cpu;
>  
> +    /* when system emulation is not available, this pointer is NULL */
> +    struct CPUSystemOperations system_ops;
> +
>      /* when TCG is not available, this pointer is NULL */
>      struct TCGCPUOps *tcg_ops;
>  };
> 


