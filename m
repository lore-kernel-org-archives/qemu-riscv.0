Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNCwX-0003GP-Fj
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 08:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNCwV-0003Ev-Us
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 08:14:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNCwU-0002ZZ-Dq
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 08:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675257265;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CBnIdrigAg4xq9Nn0pkiCzy+TzCK0IYmPxCBJAeioM4=;
 b=Dj2zQOq4RYvO+kWIvtOb7lLw4iV4PnkFBlsiaAZW/S6YIGq1ct1udpqyHWruxUYQAReipM
 YXuEiHRUXV6Dp9kdyXlUTTvYt/xx8R4kk9bLa1x8K8GX/AHLg7KBjMC/F8228JqXTa/AnL
 MbFeggRI2qr/4H8ckgvoe6wox/2coXw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-xZQ3QbZzNjiTBDDPMgT4Lg-1; Wed, 01 Feb 2023 08:14:22 -0500
X-MC-Unique: xZQ3QbZzNjiTBDDPMgT4Lg-1
Received: by mail-wm1-f72.google.com with SMTP id
 iv6-20020a05600c548600b003dc4b8ee42fso6777898wmb.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Feb 2023 05:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBnIdrigAg4xq9Nn0pkiCzy+TzCK0IYmPxCBJAeioM4=;
 b=ka0XYbPA1QAKph1l2Nom7vXHlmIaRRYI1ownbg6vdT1eENET5Nb9Nl+Z0bjVpziXUt
 08Y+GZOFTOfbLuol6kThznp1AJOsPaC8JqkpUEBRD/23h9usj8ZjmwakQSdgcegOqkss
 K8sGKFiZJYxWMPSIbrv8VSx2vz7tr9OLLBMdqHWCSyIpNAxOuvF+dvciPnnAtTARk0fD
 AXP0s9ahaWGxct5EYNoIxXyKQD+AN3QfMHrszzsVrTXYEV1l0Krpyciz+Y97U+u2lcGU
 C9SgwHOPxsoGzg1hKTW16cl4OwfYx9t9bWnyy1myyZQ9Cl18lyO9aL7cRiALa+JTWlTA
 1H+g==
X-Gm-Message-State: AO0yUKX6Fhmwe0PGGNFuw/P7xTVroEm1pfgygRsyI3Vk/duL8VoieACA
 wDCwkEWuYNmyGEkfF+icH1G2x+lAUVOMti1sjRBN5J3Sd8PfDJ81HZftXdRK+kOtGDcjjlgsDOP
 C6U5Y2IZ/4Ah8bP4=
X-Received: by 2002:a05:600c:4f03:b0:3dd:e86e:8827 with SMTP id
 l3-20020a05600c4f0300b003dde86e8827mr1890229wmq.4.1675257261465; 
 Wed, 01 Feb 2023 05:14:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9CyzHeq/DwG6rKtBoNVxBsEsdk82yvIqWlasVfWNFldjWjAq+H5O9Yo4NB+BTjopQZA3jv2w==
X-Received: by 2002:a05:600c:4f03:b0:3dd:e86e:8827 with SMTP id
 l3-20020a05600c4f0300b003dde86e8827mr1890191wmq.4.1675257261254; 
 Wed, 01 Feb 2023 05:14:21 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 v2-20020a05600c15c200b003dc54eef495sm1643451wmf.24.2023.02.01.05.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 05:14:20 -0800 (PST)
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
In-Reply-To: <875ycly2h5.fsf@pond.sub.org> (Markus Armbruster's message of
 "Wed, 01 Feb 2023 13:49:58 +0100")
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
 <87sffsnmb2.fsf@secure.mitica> <875ycly2h5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 01 Feb 2023 14:14:19 +0100
Message-ID: <87bkmdfrys.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
X-List-Received-Date: Wed, 01 Feb 2023 13:14:28 -0000

Markus Armbruster <armbru@redhat.com> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> Markus Armbruster <armbru@redhat.com> wrote:
>>> The script drops #include "qemu/osdep.h" from headers.  Mention it in
>>> the commit message it uses for --git.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>  scripts/clean-includes | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/scripts/clean-includes b/scripts/clean-includes
>>> index f0466a6262..f9722c3aec 100755
>>> --- a/scripts/clean-includes
>>> +++ b/scripts/clean-includes
>>> @@ -193,8 +193,8 @@ if [ "$GIT" = "yes" ]; then
>>>      git commit --signoff -F - <<EOF
>>>  $GITSUBJ: Clean up includes
>>>  
>>> -Clean up includes so that osdep.h is included first and headers
>>> -which it implies are not included manually.
>>> +Clean up includes so that qemu/osdep.h is included first in .c, and
>>> +not in .h, and headers which it implies are not included manually.
>>
>> I give a tree.
>>
>> Clean up includes so qemu/osdep.h is never used in .h files.  It makes
>> sure that qemu/osdep.h is only used in .c files.  Once there, it assures
>> that .h files already included in qemu/osdep.h are not included a second
>> time on the .c file.
>>
>> What do you think?
>
> Neglects to mention qemu/osdep.h goes first in .c.

/me tries again

What about:

The file qemu/osdep.h should only be included in .c files.  And it has
to be the first included file.

This script does several things:
- Remove qemu/osdep.h from .h files.
- If qemu/osdep.h is included in a .c file it is moved to the first
  included position if it is anywhere else.
- Remove from .c files all include files that are already present in
  qemu/osdep.h.

Later, Juan.


