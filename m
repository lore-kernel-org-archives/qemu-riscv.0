Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNEVA-0005B9-47
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 09:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEV7-00052Z-Vq
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 09:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNEV6-0007mw-Cl
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 09:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675263255;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rli+7QqLtkD0IltQemu/9idMcsAx9s7XKPRZlDuPyks=;
 b=apjQfK5LIbaysubWACPS6PCYT1BWffmseJjEVKj1m4vOeg0H3xUiiSou1kJfyGznNMqUTV
 IneugTg6VclI5OIMzVv9d7k4tyeKyNLz9+DaRK/Wv91fiZGXN2btjtgtPM1hRoOKcUVkVZ
 zdr/qXWxNdfUp8xlWHj2Mexu+LHhQIo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-gR-pKu3HO9a9SpZ76za74A-1; Wed, 01 Feb 2023 09:54:12 -0500
X-MC-Unique: gR-pKu3HO9a9SpZ76za74A-1
Received: by mail-wm1-f69.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so1109685wmq.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Feb 2023 06:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rli+7QqLtkD0IltQemu/9idMcsAx9s7XKPRZlDuPyks=;
 b=dnTN/9dkp1+ogYv1n7CbY2LaTNLEuLgwtuUzzTHqlcrMnSHRuT9wA+rObyRfdBV0T0
 Cw2gfFsMk98/gVU6woNPsHcd4D9AVG+wJbcePyW5tnbRVd1j+c2KojoNbaUJf8rH6PW/
 i8EmCK70ZeD/d+DDLi+vM23a9rpEOQDjGQeGOdQC021zQOtTd/dqtHk17jCNXje9Yv9p
 j03UnU/HfzXeA67rWP1/KCUHyOC3QW/ZunthfFTUKObG4mkpGPvHK96Pch5zWjV32PsG
 z2VFgjXyNasVU9GpmW0VIORtx+6U+vgFjK5s1s40XZX8OPpY4OaDCdW/ggLiByQI1rP3
 C2MQ==
X-Gm-Message-State: AO0yUKUGBunMBKdlhEanEPou/kx1EG+QxlVQjHLhok7Ucjb/+2suUxKq
 UT0t+P6zUbkNYvfkkQJng1u7AKMu7hTdsd+ADkkMd2g/jkUVM4IwjlL2JIkJWVZHYUvJDaWla6X
 Hd5IUk8oYfwRxxNw=
X-Received: by 2002:a5d:6f08:0:b0:2be:110d:5d59 with SMTP id
 ay8-20020a5d6f08000000b002be110d5d59mr2846015wrb.51.1675263250850; 
 Wed, 01 Feb 2023 06:54:10 -0800 (PST)
X-Google-Smtp-Source: AK7set81sQiLFlKfIUP9BniB+PZyYqM10ctV5D/EhpK12WABCrtD7J2sZ27y5TEcMD65gUfJsLXOGA==
X-Received: by 2002:a5d:6f08:0:b0:2be:110d:5d59 with SMTP id
 ay8-20020a5d6f08000000b002be110d5d59mr2845979wrb.51.1675263250584; 
 Wed, 01 Feb 2023 06:54:10 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k4-20020a5d66c4000000b002bdc19f8e8asm17616608wrw.79.2023.02.01.06.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 06:54:10 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
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
In-Reply-To: <87cz6twldq.fsf@pond.sub.org> (Markus Armbruster's message of
 "Wed, 01 Feb 2023 14:44:33 +0100")
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
 <87sffsnmb2.fsf@secure.mitica> <875ycly2h5.fsf@pond.sub.org>
 <87bkmdfrys.fsf@secure.mitica> <87cz6twldq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 01 Feb 2023 15:54:09 +0100
Message-ID: <877cx11lny.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
X-List-Received-Date: Wed, 01 Feb 2023 14:54:18 -0000

Markus Armbruster <armbru@redhat.com> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> Markus Armbruster <armbru@redhat.com> wrote:
>>> Juan Quintela <quintela@redhat.com> writes:
>>>
>>>> Markus Armbruster <armbru@redhat.com> wrote:
>>>>> The script drops #include "qemu/osdep.h" from headers.  Mention it in
>>>>> the commit message it uses for --git.
>>>>>
>>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>>> ---
>>>>>  scripts/clean-includes | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/scripts/clean-includes b/scripts/clean-includes
>>>>> index f0466a6262..f9722c3aec 100755
>>>>> --- a/scripts/clean-includes
>>>>> +++ b/scripts/clean-includes
>>>>> @@ -193,8 +193,8 @@ if [ "$GIT" = "yes" ]; then
>>>>>      git commit --signoff -F - <<EOF
>>>>>  $GITSUBJ: Clean up includes
>>>>>  
>>>>> -Clean up includes so that osdep.h is included first and headers
>>>>> -which it implies are not included manually.
>>>>> +Clean up includes so that qemu/osdep.h is included first in .c, and
>>>>> +not in .h, and headers which it implies are not included manually.
>>>>
>>>> I give a tree.
>>>>
>>>> Clean up includes so qemu/osdep.h is never used in .h files.  It makes
>>>> sure that qemu/osdep.h is only used in .c files.  Once there, it assures
>>>> that .h files already included in qemu/osdep.h are not included a second
>>>> time on the .c file.
>>>>
>>>> What do you think?
>>>
>>> Neglects to mention qemu/osdep.h goes first in .c.
>>
>> /me tries again
>>
>> What about:
>>
>> The file qemu/osdep.h should only be included in .c files.  And it has
>> to be the first included file.
>
> Suggest "has to be included first."

Ok to this change.

>
>> This script does several things:
>> - Remove qemu/osdep.h from .h files.
>
> Correct.  Could say "inclusion of qemu/osdep.h"

I try to minimize whatever word that "includes" "includ*" (pun intended).

>> - If qemu/osdep.h is included in a .c file it is moved to the first
>>   included position if it is anywhere else.
>
> Not quite.  The script ensures all the .c include it, and include it
> first.

Oh, then it is easier.

- It ensures that qemu/osdep.h is the first included file in all .c files.

>> - Remove from .h files all include files that are already present in
>>   qemu/osdep.h.
>
> They're removed from .h, too.

Ah, didn't know this bit.

> Sure you want to continue wordsmithing?  ;)

Yeap, I *hate* error messages that I can't parse (or have to read it ten
times before I understand them).

So, we end with:

The file qemu/osdep.h should only be included in .c files.  And it has
to be included first.

This script does three things:
- Remove qemu/osdep.h from .h files.
- It ensures that qemu/osdep.h is the first included file in all .c files.
- Include files contained in qemu/osdep.h are removed form all .c and .h
  files.

Is this better?

Later, Juan.


