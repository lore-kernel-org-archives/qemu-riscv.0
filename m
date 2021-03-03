Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHTGi-0006RZ-UA
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 10:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lHTGf-0006OR-Mo; Wed, 03 Mar 2021 10:18:29 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:51707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lHTGc-0004JZ-T1; Wed, 03 Mar 2021 10:18:29 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N7QM9-1lrP7u2sg9-017mYC; Wed, 03 Mar 2021 16:17:31 +0100
Subject: Re: [PATCH v3 17/27] linux-user: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-18-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0872e9eb-3fe1-8f93-d863-c5f39129b03e@vivier.eu>
Date: Wed, 3 Mar 2021 16:17:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302145818.1161461-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2JXp+7ZoES5GqgV5w23yqcdKYFTwl4HOJCG7+RWaa2UvqiZtXob
 5rrmjdhCzcLXd2SVSxizLUI0RS3eKTaJ2P05JEl54+oLCgdMfspNGaD9m3PFQSbMyU8MzKv
 JmxCz6d5KvA1Jym5MA6TsQkwIMhMgntEJgFHklsLszBExX6yWYjOjVU01PWUe+XVgjUqoIY
 LWjTYX9wlaqhklCgsChqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iLRh7jT9iQM=:Emy5oafqFNjrK4s5qDN/qw
 sTTSzMwBeTDgE2DACpIdVYpiyDNTwBDPBeJI6Xufjunb10nrMrTbMz1peEfd3hMqpaV9oCsXV
 R3GP/pejjpjobaXsKR7EAPOuTh/6YC1/UkppcCZMQUB38fyhtWZEVPq22BdVe1pCUPszGIP4A
 4sxp2MpO/YgCBALDo2+rhZIarlp7/r/bBEPM2ZdC37XVGqm6l6F50omL5WqzJUtqirSymvPbl
 DJfY22ECIuALwXCbRl4zd8uXCxoUe8hGUt0eLRQqaF5tv1d/a0mNtDy/ijjUp7z3Z4C/80WST
 p2NyQO43NQEU8c60gnGjUETHmSkzE3AP9ab4n700APSKyORsfHPGg8HD4V0taEfh2QTyuk/ez
 QpiWqNvVDrTlPhv6RbqdewunI0OaEc8ivOPJ7DVuMrFcn52LalKC+BrrulCJqKH1G/Bs4li+R
 PUFEDgt0nA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 Mar 2021 15:18:30 -0000

Le 02/03/2021 à 15:58, Philippe Mathieu-Daudé a écrit :
> We can not use watchpoints in user-mode emulation because we
> need the softmmu slow path to detect accesses to watchpointed
> memory. This code is expanded as empty stub in "hw/core/cpu.h"
> anyway, so we can drop it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/main.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 81f48ff54ed..d7af3ffbc22 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -200,7 +200,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
>      CPUState *new_cpu = cpu_create(cpu_type);
>      CPUArchState *new_env = new_cpu->env_ptr;
>      CPUBreakpoint *bp;
> -    CPUWatchpoint *wp;
>  
>      /* Reset non arch specific state */
>      cpu_reset(new_cpu);
> @@ -211,13 +210,9 @@ CPUArchState *cpu_copy(CPUArchState *env)
>         Note: Once we support ptrace with hw-debug register access, make sure
>         BP_CPU break/watchpoints are handled correctly on clone. */
>      QTAILQ_INIT(&new_cpu->breakpoints);
> -    QTAILQ_INIT(&new_cpu->watchpoints);
>      QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>          cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
>      }
> -    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> -        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
> -    }
>  
>      return new_env;
>  }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

