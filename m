Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pITIU-0004D4-Mu
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 06:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pITIT-0004Ci-Ga
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 06:41:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pITIS-0006G8-4w
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 06:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674128491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CmPsP3SGpWPOTwWlj7ijZlZ6iruaUyXHSnd1sesgPfw=;
 b=SJMcASpxV2OW5DSJD/wNF2Uff5T+vVZoE7Vz0oxvWPM50yA6Ne/oPfG8gBHRgU/l8AH+Do
 k/XmHokYw1jo59snF1VDs57T8VxqbWYzZ45QPk6BZQgsVx54q8ER4Y8wxqs6Ghb+N214of
 74HQN97Ohcgh2ZgsmkPABtmju1gdw80=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-trcBebO8OVy3wISNSwH_cw-1; Thu, 19 Jan 2023 06:41:27 -0500
X-MC-Unique: trcBebO8OVy3wISNSwH_cw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A3181C05148;
 Thu, 19 Jan 2023 11:41:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95A082026D68;
 Thu, 19 Jan 2023 11:41:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A9A221E6A28; Thu, 19 Jan 2023 12:41:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 peter.maydell@linaro.org,  alistair@alistair23.me,  jasowang@redhat.com,
 jonathan.cameron@huawei.com,  kbastian@mail.uni-paderborn.de,
 quintela@redhat.com,  dgilbert@redhat.com,  michael.roth@amd.com,
 kkostiuk@redhat.com,  tsimpson@quicinc.com,  palmer@dabbelt.com,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 16/19] Fix non-first inclusions of qemu/osdep.h
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-17-armbru@redhat.com>
 <a25d449f-ceb5-54d8-ad07-9e6517d6e016@linaro.org>
Date: Thu, 19 Jan 2023 12:41:24 +0100
In-Reply-To: <a25d449f-ceb5-54d8-ad07-9e6517d6e016@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 19 Jan 2023 11:40:06
 +0100")
Message-ID: <873586u4yj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Thu, 19 Jan 2023 11:41:34 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 07:59, Markus Armbruster wrote:
>> This commit was created with scripts/clean-includes.
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>

[...]

> Up to here:
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>> diff --git a/util/async-teardown.c b/util/async-teardown.c
>> index 62bfce1b3c..62cdeb0f20 100644
>> --- a/util/async-teardown.c
>> +++ b/util/async-teardown.c
>> @@ -10,16 +10,12 @@
>>    * option) any later version.  See the COPYING file in the top-level d=
irectory.
>>    *
>>    */
>> -#include <stdlib.h>
>> -#include <stdio.h>
>> -#include <sys/types.h>
>> -#include <dirent.h>
>> -#include <sys/prctl.h>
>> -#include <signal.h>
>> -#include <sched.h>
>> -#include <unistd.h>
>>=20=20
>>  #include "qemu/osdep.h"
>> +#include <dirent.h>
>> +#include <sys/prctl.h>
>> +#include <sched.h>
>> +
>>   #include "qemu/async-teardown.h"
>
> This file has more changes.

I'm not sure I understand.

The patch does two related things:

1. It puts qemu/osdep.h first.  The diff makes it look like we leave it
   in place and move other stuff across, but that's the same.

2. It deletes inclusions of headers qemu/osdep.h already includes:

    <stdlib.h>
    <stdio.h>
    <sys/types.h>
    <signal.h>
    <unistd.h>

What would you like me to change or explain?


