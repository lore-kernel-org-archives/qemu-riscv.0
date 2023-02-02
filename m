Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNXFA-0000oA-VC
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 05:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXF8-0000nc-Ot
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 05:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXF5-0003Yq-J4
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 05:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675335298;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NLSAVDoZylH9Kgdm2kdmt4N6jPXJUGvaGdKnV+wEGHI=;
 b=dIy1xYHNwXtGsSZkWo1rlcEFwXDNyk7lkzJjyMBTYbpjcpfnapQ1J8FEjKxCnE2W82kuIX
 xwADeXtLiqT6S8v230U9oVbfmFRhSo24x6jnb7+QBm06lRUFkStfY/XgW7toAhQIRMzkJf
 Be9jpUqJLjMdtV8M5iRikTfnIb4y33M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-cMZCatOOMUCm8SQ6q8dUbQ-1; Thu, 02 Feb 2023 05:54:57 -0500
X-MC-Unique: cMZCatOOMUCm8SQ6q8dUbQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 d18-20020a05600c34d200b003df901ab982so804788wmq.4
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 02:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLSAVDoZylH9Kgdm2kdmt4N6jPXJUGvaGdKnV+wEGHI=;
 b=gG+ywummzIDkm8tsz3j3iWkBGWkdWuQH/t1n01vsOaYpz/Kxzw4LNVAt16C4/uU3/K
 TwUtcB1SefOl0RnkIlW9KOn7l2SPP80RYLNsZyXPrIEBbXZws7cTPI4/5S1tKvqgnIig
 gzs81WXCZGiu0/VP0RhyERtnxnuW4BzCFmbdzwOM276bbXA5py7J59ld0zCTSGE6xrzD
 x9OhoCdKTCC83YVCPMFcl9Ia6OsHxfQ7YoTyO5Q2t4fDp7A53aS0C4M2wWtwuPrHfqPs
 aRJqcsgJuJWX996LptU10sSt6MzQJd8SJOLI+WJ9iFaH1CHa0oiiGf/bzS99pjYUgGFH
 7Llw==
X-Gm-Message-State: AO0yUKUGnDkDcLYpnW6VJzoevuEYLrHX7Mfo28nPrhRzemYzXZqVimD6
 RoR3a07Ym2PNHSLLqHTFRrW52vp3MvAtnhV2Hv5hF/UHUomLqFeszaTj/yujDk/0cUhEqtydBmZ
 stP4I0IS5So3SbXE=
X-Received: by 2002:a05:600c:1e8d:b0:3df:deb5:6ff5 with SMTP id
 be13-20020a05600c1e8d00b003dfdeb56ff5mr1061636wmb.24.1675335296022; 
 Thu, 02 Feb 2023 02:54:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8DaXM9gSYh/45BWzUlNpkLzkh2cUwMTm10tdgAFg15v78gsYhSUbWuQYjC0ffljA596j4fOQ==
X-Received: by 2002:a05:600c:1e8d:b0:3df:deb5:6ff5 with SMTP id
 be13-20020a05600c1e8d00b003dfdeb56ff5mr1061603wmb.24.1675335295873; 
 Thu, 02 Feb 2023 02:54:55 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a18-20020a5d5092000000b002bdd8f12effsm19369533wrt.30.2023.02.02.02.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:54:55 -0800 (PST)
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
In-Reply-To: <87k010phku.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 02 Feb 2023 10:00:49 +0100")
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
 <87sffsnmb2.fsf@secure.mitica> <875ycly2h5.fsf@pond.sub.org>
 <87bkmdfrys.fsf@secure.mitica> <87cz6twldq.fsf@pond.sub.org>
 <877cx11lny.fsf@secure.mitica> <87k010phku.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 02 Feb 2023 11:54:54 +0100
Message-ID: <87zg9ws5fl.fsf@secure.mitica>
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
X-List-Received-Date: Thu, 02 Feb 2023 10:55:03 -0000

Markus Armbruster <armbru@redhat.com> wrote:

> It's less terse.  Fine with me.  The mix of passive and active voice
> feels a bit awkward, though.  Another try:
>
>   All .c should include qemu/osdep.h first.  This script performs three
>   related cleanups:
>
>   * Ensure .c files include qemu/osdep.h first.
>   * Including it in a .h is redundant, since the .c  already includes
>     it.  Drop such inclusions.
>   * Likewise, including headers qemu/osdep.h includes is redundant.
>     Drop these, too.

Perfect, thanks.

Reviewed-by: Juan Quintela <quintela@redhat.com>

or whatever you want it O:-)


