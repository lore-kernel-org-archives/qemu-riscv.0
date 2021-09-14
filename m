Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQAhi-0006FF-It
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 11:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAhg-0006Ag-5u
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 11:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAhb-0001FJ-P0
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 11:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631634629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbQHstuguLGguwNwEH9yKdw3QROFtfW0lRABjmr0LcA=;
 b=OM/tE0A2xgWLYsWzX2AXBID9h2m9kFjPDLtKDhzXnOBO8TAAHDk2ixbNYTZbGO4S7XHaYE
 KD4WtqrwhcLsnE1hC9xrr2Kyu/f+9Z+9bEUfellrZyqJ0wyZLqC1w07BB9qDn//kn4kiy8
 FnA72+XD8CDITKSWQIUJCNnpKkWT+J4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-wO51cGAiMc-L0-jO6R36vA-1; Tue, 14 Sep 2021 11:50:28 -0400
X-MC-Unique: wO51cGAiMc-L0-jO6R36vA-1
Received: by mail-wm1-f72.google.com with SMTP id
 y12-20020a1c7d0c000000b003077f64d75fso2434070wmc.7
 for <qemu-riscv@nongnu.org>; Tue, 14 Sep 2021 08:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UbQHstuguLGguwNwEH9yKdw3QROFtfW0lRABjmr0LcA=;
 b=nw+fRLekBlEg2JB+CXWQrmtlqlA37ibg/n0MLTpYaeauToRwESSrFGSQ+hr7JvhnSk
 vgI3Vjx46IHTm2Bu69MtJyiEd+ug42HkkJ0jPDGTW9S6Dr3MzIvCs08PNfPPASd+1HJy
 pDvgvMnUv9CoD/d5uxxnKgRm4xo30MCbcgT/IgRpnxPJ78bcc7JDd28gon2sly8TcpNk
 ze+j0gabqauohPBIySpaes4g2riXU8LyDIZu9I6Dq8VfhI429SHBfNE5WDIwA1wCfamC
 9tqXQai08F3x/I2d4nV3bDLpGAsA0rx15D80wzBtNoNqp16tDOXku6JzTJaHVpWRs1ML
 KzhA==
X-Gm-Message-State: AOAM533YC9GjovJdkw9u3UwuYl/B7FwoxN28LsCb7m5Z180hRIlOCUd+
 CjWKkifxT8Ab3HLuwDzj00x4nJK/dqosfRFUzkEdtSKij3Jg/JGklQtY2VrEoboV2B92oujb8it
 wnfP+H24AiFqT63k=
X-Received: by 2002:a7b:cf02:: with SMTP id l2mr2886714wmg.47.1631634627270;
 Tue, 14 Sep 2021 08:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD0sCPyg1USChk7EQNQ+iko9oWyJoXU6WuDi15FaNJI16mOW+AVqGYriMrUPUdNLYknMn/ZA==
X-Received: by 2002:a7b:cf02:: with SMTP id l2mr2886670wmg.47.1631634627067;
 Tue, 14 Sep 2021 08:50:27 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id p6sm1386042wmq.48.2021.09.14.08.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:50:26 -0700 (PDT)
Subject: Re: [PATCH v2 28/53] monitor: remove 'info ioapic' HMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Peter Xu <peterx@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-29-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a8bdd82b-2784-faed-56c2-07071f0d5838@redhat.com>
Date: Tue, 14 Sep 2021 17:50:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-29-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Sep 2021 15:50:36 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> This command was turned into a no-op four years ago in
> 
>   commit 0c8465440d50c18a7bb13d0a866748f0593e193a
>   Author: Peter Xu <peterx@redhat.com>
>   Date:   Fri Dec 29 15:31:04 2017 +0800
> 
>     hmp: obsolete "info ioapic"
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hmp-commands-info.hx         | 15 ---------------
>  include/monitor/hmp-target.h |  1 -
>  target/i386/monitor.c        |  6 ------
>  3 files changed, 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


