Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jY5z5-0006l6-GX
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 06:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jY5z4-0006kM-Jr
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 06:48:30 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31795
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jY5z3-0000a1-Ts
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 06:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589194109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlmmA2MHC2p9ucBn5WuzMb+82+m0WhyyJAMEd9g6YCk=;
 b=aq8ufIiO7l1TMEDMebb6wpMwAZrtd2OC5z8tDEunYkqnr8zFygltw4xxbwqs7oCrNby8xU
 sXkrE66cdMxL5iFVeu1UafI1S6LcFoKqM2Dtgc7SoMu5uQz+H9cEYHX6WETpgXmUDWF7Bv
 mBZa4ut9ssBj8+llXRfMf4CUiy7NWg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-3HDEFuK_NcqXad5t8TAN2Q-1; Mon, 11 May 2020 06:48:25 -0400
X-MC-Unique: 3HDEFuK_NcqXad5t8TAN2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40BA2100CCCA;
 Mon, 11 May 2020 10:48:22 +0000 (UTC)
Received: from gondolin (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 600E9196B9;
 Mon, 11 May 2020 10:48:13 +0000 (UTC)
Date: Mon, 11 May 2020 12:48:04 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Max Filippov
 <jcmvbkbc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Stafford Horne <shorne@gmail.com>, Roman
 Bolshakov <r.bolshakov@yadro.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-s390x@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marek Vasut <marex@denx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, Aurelien Jarno
 <aurelien@aurel32.net>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Chris Wulff <crwulff@gmail.com>, Richard Henderson
 <rth@twiddle.net>, David Gibson <david@gibson.dropbear.id.au>, David
 Hildenbrand <david@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 08/11] target/s390x: Restrict system-mode declarations
Message-ID: <20200511124804.1a7a43aa.cohuck@redhat.com>
In-Reply-To: <20200509130910.26335-9-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-9-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 01:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 11 May 2020 10:48:30 -0000

On Sat,  9 May 2020 15:09:07 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> As these declarations are restricted to !CONFIG_USER_ONLY in
> helper.c, only declare them when system-mode emulation is used.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/s390x/internal.h | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/target/s390x/internal.h b/target/s390x/internal.h
> index c1678dc6bc..ddc276cdf4 100644
> --- a/target/s390x/internal.h
> +++ b/target/s390x/internal.h
> @@ -236,7 +236,6 @@ int s390_cpu_write_elf64_note(WriteCoreDumpFunction f=
, CPUState *cs,
> =20
>  /* cc_helper.c */
>  const char *cc_name(enum cc_op cc_op);
> -void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
>  uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, uint64_t src, uint6=
4_t dst,
>                   uint64_t vr);
> =20
> @@ -303,18 +302,20 @@ void s390_cpu_gdb_init(CPUState *cs);
> =20
>  /* helper.c */
>  void s390_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> -hwaddr s390_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> -hwaddr s390_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
> +void do_restart_interrupt(CPUS390XState *env);
> +
> +#ifndef CONFIG_USER_ONLY
> +void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);

load_psw() is in cc_helper.c (and not in helper.c). Rather add the
#ifndef above, even if it is a bit awkward? Otherwise, the wrong
comment makes it confusing.

>  uint64_t get_psw_mask(CPUS390XState *env);
>  void s390_cpu_recompute_watchpoints(CPUState *cs);
>  void s390x_tod_timer(void *opaque);
>  void s390x_cpu_timer(void *opaque);
> -void do_restart_interrupt(CPUS390XState *env);
>  void s390_handle_wait(S390CPU *cpu);
> +hwaddr s390_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> +hwaddr s390_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
>  #define S390_STORE_STATUS_DEF_ADDR offsetof(LowCore, floating_pt_save_ar=
ea)
>  int s390_store_status(S390CPU *cpu, hwaddr addr, bool store_arch);
>  int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, hwaddr len);
> -#ifndef CONFIG_USER_ONLY
>  LowCore *cpu_map_lowcore(CPUS390XState *env);
>  void cpu_unmap_lowcore(LowCore *lowcore);
>  #endif /* CONFIG_USER_ONLY */


