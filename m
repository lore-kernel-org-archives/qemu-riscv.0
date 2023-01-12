Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFyra-0003i9-RJ
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 09:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFyrZ-0003hE-5Z
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 09:47:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFyrX-0004wG-KZ
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 09:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673534846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/fVAbhTSCKn36CoCFZfOgn98LrHMlA4vtdqO0hTv4M=;
 b=KJE9VJ8GuJ0oBRbntlzt+FoOg/+0AP1Ox9arFX63SuJXKGi8XARZFE1Yb3R1WmKcdm1kea
 cq1Ildcu42l3cvymGnuSs1pvROJ3DQm58VYxTehmKMwfw8SNJlD02vK2Z2yOwk+gzLhx04
 xVsStos6LaTOsZua3BzOmUPwXBbJs78=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-hOM0BqJPP6eRye7pR-FeKg-1; Thu, 12 Jan 2023 09:47:21 -0500
X-MC-Unique: hOM0BqJPP6eRye7pR-FeKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0629018E0920;
 Thu, 12 Jan 2023 14:47:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DAC12166B26;
 Thu, 12 Jan 2023 14:47:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40C2A21E6A36; Thu, 12 Jan 2023 15:47:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 ben.widawsky@intel.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  jasowang@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  alistair.francis@wdc.com,  bin.meng@windriver.com,
 qemu-riscv@nongnu.org,  philmd@linaro.org,  Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org>
 <20230112085520-mutt-send-email-mst@kernel.org>
Date: Thu, 12 Jan 2023 15:47:19 +0100
In-Reply-To: <20230112085520-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Thu, 12 Jan 2023 08:56:03 -0500")
Message-ID: <87zgan4xoo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jan 2023 14:47:29 -0000

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Jan 12, 2023 at 08:51:32AM -0500, Michael S. Tsirkin wrote:
>> On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
>> > docs/devel/style.rst mandates:
>> >=20
>> >     The "qemu/osdep.h" header contains preprocessor macros that affect
>> >     the behavior of core system headers like <stdint.h>.  It must be
>> >     the first include so that core system headers included by external
>> >     libraries get the preprocessor macros that QEMU depends on.
>> >=20
>> >     Do not include "qemu/osdep.h" from header files since the .c file
>> >     will have already included it.
>> >=20
>> > A few violations have crept in.  Fix them.
>> >=20
>> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> > Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
>> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>=20
>> With my awesome grep skillz I found one more:
>> $ grep -r --include=3D'*.h' qemu/osdep.h
>> include/block/graph-lock.h:#include "qemu/osdep.h"

Crept in after I prepared my v1.  I neglected to re-check.

> Also:
> $ grep -r --include=3D'*.inc' qemu/osdep.h
> ui/vnc-enc-zrle.c.inc:#include "qemu/osdep.h"
> crypto/akcipher-nettle.c.inc:#include "qemu/osdep.h"
> crypto/akcipher-gcrypt.c.inc:#include "qemu/osdep.h"
> crypto/rsakey-nettle.c.inc:#include "qemu/osdep.h"
> crypto/cipher-gnutls.c.inc:#include "qemu/osdep.h"
> target/xtensa/core-dc233c/xtensa-modules.c.inc:#include "qemu/osdep.h"
> target/xtensa/core-sample_controller/xtensa-modules.c.inc:#include "qemu/=
osdep.h"
> target/xtensa/core-de212/xtensa-modules.c.inc:#include "qemu/osdep.h"
> target/xtensa/core-dc232b/xtensa-modules.c.inc:#include "qemu/osdep.h"
> target/xtensa/core-fsf/xtensa-modules.c.inc:#include "qemu/osdep.h"
> target/cris/translate_v10.c.inc:#include "qemu/osdep.h"

Good point.  Looks like I successfully supressed all memory of .inc.

>> Looks like all C files must include qemu/osdep.h, no?

I remember there are a few exceptions, but I don't remember which .c
they are.  Hmm... see commit 4bd802b209cff612d1a99674a91895b735be8630.

>> How about
>>=20
>> 1- add -include qemu/osdep.h on compile command line
>>    drop #include "qemu/osdep.h" from C files

Then you need to encode the exceptions in the build system.  Which might
not be a bad thing.

>> 2- drop double include guards, replace with a warning.
>>=20
>> following patch implements part 2:
>>=20
>>=20
>> qemu/osdep: don't include it from headers
>>=20
>> doing so will lead to trouble eventually - instead of
>> working around such cases make it more likely it will fail.
>>=20
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>=20
>> ---
>>=20
>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index 7d059ad526..e4a60f911c 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -24,7 +24,12 @@
>>   * This work is licensed under the terms of the GNU GPL, version 2 or l=
ater.
>>   * See the COPYING file in the top-level directory.
>>   */
>> -#ifndef QEMU_OSDEP_H
>> +#ifdef QEMU_OSDEP_H
>> +#warning "Never include qemu/osdep.h from a header!"
>> +#endif
>> +
>> +static inline void qemu_osdep_never_include_from_header(void) {}
>> +

Why do you need the function, too?

>>  #define QEMU_OSDEP_H
>>=20=20
>>  #include "config-host.h"
>> @@ -714,5 +719,3 @@ static inline int platform_does_not_support_system(c=
onst char *command)
>>  #ifdef __cplusplus
>>  }
>>  #endif
>> -
>> -#endif


