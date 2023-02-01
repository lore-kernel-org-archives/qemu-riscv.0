Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNDPt-00084b-UA
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 08:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNDPs-000849-LX
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 08:44:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNDPl-00005f-1s
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 08:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675259079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ABvlaW6lln5EfQe9k5Yte/64Rpa+4X/dMQ8OHLReg3A=;
 b=U827ZEHYb/CiFu/IQSxURtZO7J3HUrrXw2QXwMGxnQuFvDZpRUnrOvAmSyqkZQTZKxPDcE
 XXlY4Ew6Ll05q3VofNo2GbSW1PFX8OB+RtmR5ZMTgX+66Rw7vPLJ7AzvvM0TrR4dq3Xixp
 J+a7Ego7OspUxKuxCtPvd5bs/J7Lx3Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-tSKhyyHVNzWaWPFgxe36sA-1; Wed, 01 Feb 2023 08:44:36 -0500
X-MC-Unique: tSKhyyHVNzWaWPFgxe36sA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75E6018E0923;
 Wed,  1 Feb 2023 13:44:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D58B6422AE;
 Wed,  1 Feb 2023 13:44:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BFF2421E6A1F; Wed,  1 Feb 2023 14:44:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v5 04/20] scripts/clean-includes: Improve --git commit
 message
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
 <87sffsnmb2.fsf@secure.mitica> <875ycly2h5.fsf@pond.sub.org>
 <87bkmdfrys.fsf@secure.mitica>
Date: Wed, 01 Feb 2023 14:44:33 +0100
In-Reply-To: <87bkmdfrys.fsf@secure.mitica> (Juan Quintela's message of "Wed, 
 01 Feb 2023 14:14:19 +0100")
Message-ID: <87cz6twldq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-List-Received-Date: Wed, 01 Feb 2023 13:44:48 -0000

Juan Quintela <quintela@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> wrote:
>> Juan Quintela <quintela@redhat.com> writes:
>>
>>> Markus Armbruster <armbru@redhat.com> wrote:
>>>> The script drops #include "qemu/osdep.h" from headers.  Mention it in
>>>> the commit message it uses for --git.
>>>>
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>> ---
>>>>  scripts/clean-includes | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/scripts/clean-includes b/scripts/clean-includes
>>>> index f0466a6262..f9722c3aec 100755
>>>> --- a/scripts/clean-includes
>>>> +++ b/scripts/clean-includes
>>>> @@ -193,8 +193,8 @@ if [ "$GIT" = "yes" ]; then
>>>>      git commit --signoff -F - <<EOF
>>>>  $GITSUBJ: Clean up includes
>>>>  
>>>> -Clean up includes so that osdep.h is included first and headers
>>>> -which it implies are not included manually.
>>>> +Clean up includes so that qemu/osdep.h is included first in .c, and
>>>> +not in .h, and headers which it implies are not included manually.
>>>
>>> I give a tree.
>>>
>>> Clean up includes so qemu/osdep.h is never used in .h files.  It makes
>>> sure that qemu/osdep.h is only used in .c files.  Once there, it assures
>>> that .h files already included in qemu/osdep.h are not included a second
>>> time on the .c file.
>>>
>>> What do you think?
>>
>> Neglects to mention qemu/osdep.h goes first in .c.
>
> /me tries again
>
> What about:
>
> The file qemu/osdep.h should only be included in .c files.  And it has
> to be the first included file.

Suggest "has to be included first."

> This script does several things:
> - Remove qemu/osdep.h from .h files.

Correct.  Could say "inclusion of qemu/osdep.h"

> - If qemu/osdep.h is included in a .c file it is moved to the first
>   included position if it is anywhere else.

Not quite.  The script ensures all the .c include it, and include it
first.

> - Remove from .c files all include files that are already present in
>   qemu/osdep.h.

They're removed from .h, too.

Sure you want to continue wordsmithing?  ;)


