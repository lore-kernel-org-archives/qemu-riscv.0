Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHhLx-0008MV-Kl
	for mharc-qemu-riscv@gnu.org; Thu, 04 Mar 2021 01:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHhLv-0008KB-R0
 for qemu-riscv@nongnu.org; Thu, 04 Mar 2021 01:20:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHhLs-0004BA-I2
 for qemu-riscv@nongnu.org; Thu, 04 Mar 2021 01:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614838847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jwlFjIvTLB64JFd3g801Gm8i/nRn1yY+VxrHOrCoZI=;
 b=L53U+MJCHv8jiN66fr0ZZGenjkkGxSAFlP+4QmSZDXnk38TNjXCSe7V5Zh6BTpWhyLNtn3
 jVcHbOpLCBDHITFGw8O3ThwqUw+JxtvAstrt4dHBxyi49KIpDYlQWpTpIe9Si3qMSAPdRj
 LGELFcb4MHIuKSvVlQANNJavbVmgDFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-hKWfKNPfMfKkewVNCjyI9A-1; Thu, 04 Mar 2021 01:20:43 -0500
X-MC-Unique: hKWfKNPfMfKkewVNCjyI9A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4B0B107ACC7;
 Thu,  4 Mar 2021 06:20:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47F7117250;
 Thu,  4 Mar 2021 06:20:28 +0000 (UTC)
Subject: Re: [PATCH 4/7] target/s390x: Move s390_cpu_has_work to excp_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210302102737.1031287-1-f4bug@amsat.org>
 <20210302102737.1031287-5-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1d16e3f8-0d8f-3036-94bf-9ae081658ad4@redhat.com>
Date: Thu, 4 Mar 2021 07:20:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302102737.1031287-5-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 04 Mar 2021 06:20:52 -0000

On 02/03/2021 11.27, Philippe Mathieu-Daudé wrote:
> We will restrict the s390_cpu_has_work() function to TCG.
> First declare it in "internal.h" and move it to excp_helper.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/s390x/internal.h    |  1 +
>   target/s390x/cpu.c         | 17 -----------------
>   target/s390x/excp_helper.c | 18 ++++++++++++++++++
>   3 files changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/target/s390x/internal.h b/target/s390x/internal.h
> index 11515bb6173..7184e38631c 100644
> --- a/target/s390x/internal.h
> +++ b/target/s390x/internal.h
> @@ -263,6 +263,7 @@ ObjectClass *s390_cpu_class_by_name(const char *name);
>   
>   
>   /* excp_helper.c */
> +bool s390_cpu_has_work(CPUState *cs);
>   void s390x_cpu_debug_excp_handler(CPUState *cs);
>   void s390_cpu_do_interrupt(CPUState *cpu);
>   bool s390_cpu_exec_interrupt(CPUState *cpu, int int_req);
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index d35eb39a1bb..91142db1097 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -56,23 +56,6 @@ static void s390_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.psw.addr = value;
>   }
>   
> -static bool s390_cpu_has_work(CPUState *cs)
> -{
> -    S390CPU *cpu = S390_CPU(cs);
> -
> -    /* STOPPED cpus can never wake up */
> -    if (s390_cpu_get_state(cpu) != S390_CPU_STATE_LOAD &&
> -        s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING) {
> -        return false;
> -    }
> -
> -    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
> -        return false;
> -    }
> -
> -    return s390_cpu_has_int(cpu);
> -}
> -
>   #if !defined(CONFIG_USER_ONLY)
>   /* S390CPUClass::load_normal() */
>   static void s390_cpu_load_normal(CPUState *s)
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index ce16af394b1..64923ffb83a 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -28,12 +28,30 @@
>   #include "hw/s390x/ioinst.h"
>   #include "exec/address-spaces.h"
>   #include "tcg_s390x.h"
> +#include "qapi/qapi-types-machine.h"
>   #ifndef CONFIG_USER_ONLY
>   #include "sysemu/sysemu.h"
>   #include "hw/s390x/s390_flic.h"
>   #include "hw/boards.h"
>   #endif
>   
> +bool s390_cpu_has_work(CPUState *cs)
> +{
> +    S390CPU *cpu = S390_CPU(cs);
> +
> +    /* STOPPED cpus can never wake up */
> +    if (s390_cpu_get_state(cpu) != S390_CPU_STATE_LOAD &&
> +        s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING) {
> +        return false;
> +    }
> +
> +    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
> +        return false;
> +    }
> +
> +    return s390_cpu_has_int(cpu);
> +}
> +
>   void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
>                                                 uint32_t code, uintptr_t ra)
>   {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


