Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDQS7-0001I7-DA
	for mharc-qemu-riscv@gnu.org; Tue, 10 Aug 2021 08:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mDQS5-0001EB-KS
 for qemu-riscv@nongnu.org; Tue, 10 Aug 2021 08:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mDQS1-0004qj-Vv
 for qemu-riscv@nongnu.org; Tue, 10 Aug 2021 08:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628596904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8yJTX7eNzzbNaJggB4MTVcWm01xc/Rs3c9Spl2Cmkgo=;
 b=FPa7X9IV/PQ9vwUG/+HHosiGO6Uz5j9T9EheWB+kZqkxgvhfKNipd/NrNY7U5RYvKiYSWm
 Oi5gZglqB5qPZxeZnN2l2jHY8Ev/5zbNjbhT7iDPYcHZ3gfUAVhI2itpb7j+Y06zU8BTJG
 Rq0qKQdNTX6Xah804hOsB9HYrmR/r1A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-xoZWZ7swMfyFIiZZqVOYMA-1; Tue, 10 Aug 2021 08:01:43 -0400
X-MC-Unique: xoZWZ7swMfyFIiZZqVOYMA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f25-20020a1c6a190000b029024fa863f6b0so978655wmc.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Aug 2021 05:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=8yJTX7eNzzbNaJggB4MTVcWm01xc/Rs3c9Spl2Cmkgo=;
 b=jwZYm0DlCo9m+siNxmLlsyeGrM6SgAr4Uy2NlXz/k0Q6m8lrUC4PZrFNcHzajObRcU
 fBAutCJ+1EWUsK1S0YrO1XL5pO4eNLCoqSN0UPgEvlUxF8sj871mTq2PsySzgRS+ZmgO
 iTckT4LiIY8e/j0HUR7iYhd9c+lwCuxOtcxz34rJ3mn4w4iTGtJ3HPA99Osh7SbUVYgp
 4kfmQkhZvTWPcOODlSUAD09bqCK36JgBH6nQE1cU4bbR91qT9phopAFHDzYsGEuRxtt2
 vmBSqxldVP7tmpBKN4T3dBXzTJm0NtqauG0S63F4HZFz5Zxxb2FFRd4rwfuDzyAGyh/x
 yQ7w==
X-Gm-Message-State: AOAM531oVYRRsttACQpUl3H02AmAspl1RMMMToZIJgBxpnTOwIIWhCg3
 FpUUvZIdGlD+tGeZ8E1g1eHf/BVa1ZkB/7RLwGpQhLMLUXZNnZNCwirQ4T4PKRnZs9MbiWEhgXi
 nydzWTUE9laW+hM4=
X-Received: by 2002:a5d:658a:: with SMTP id q10mr30910134wru.343.1628596902474; 
 Tue, 10 Aug 2021 05:01:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3hzXJq/uMeMUgLEKYXP7YdeYgeEjV4RTqS2QrZnBsjiQwGsXJUTgme4xDTdtVLt8j8LEVnA==
X-Received: by 2002:a5d:658a:: with SMTP id q10mr30910057wru.343.1628596902136; 
 Tue, 10 Aug 2021 05:01:42 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id j4sm20637348wmi.4.2021.08.10.05.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 05:01:41 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org,  "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,  Philippe =?utf-8?Q?Mathi?=
 =?utf-8?Q?eu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Thomas Huth <huth@tuxfamily.org>,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Igor Mammedov <imammedo@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,  Bandan Das <bsd@redhat.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,  Tyrone Ting
 <kfting@nuvoton.com>,  Pavel Pisa <pisa@cmp.felk.cvut.cz>,  Vikram Garhwal
 <fnu.vikram@xilinx.com>,  Jason Wang <jasowang@redhat.com>,  Keith Busch
 <kbusch@kernel.org>,  Klaus Jensen <its@irrelevant.dk>,  Cornelia Huck
 <cohuck@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,  Christian
 Borntraeger <borntraeger@de.ibm.com>,  David Hildenbrand
 <david@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Vijai Kumar K
 <vijai@behindbytes.com>,  Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,  Laurent Vivier
 <laurent@vivier.eu>,  Corey Minyard <minyard@acm.org>,  =?utf-8?Q?C=C3=A9?=
 =?utf-8?Q?dric?= Le Goater
 <clg@kaod.org>,  Andrew Jeffery <andrew@aj.id.au>,  Joel Stanley
 <joel@jms.id.au>,  Francisco Iglesias <francisco.iglesias@xilinx.com>,
 David Gibson <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,  =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Taylor Simpson <tsimpson@quicinc.com>,  qemu-arm@nongnu.org,
 qemu-block@nongnu.org,  qemu-s390x@nongnu.org,  qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH for-6.2 05/12] [automated] Move QOM typedefs and add
 missing includes
In-Reply-To: <20210806211127.646908-6-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Fri, 6 Aug 2021 17:11:20 -0400")
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-6-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 10 Aug 2021 14:01:40 +0200
Message-ID: <877dgt1paz.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 10 Aug 2021 12:01:49 -0000

Eduardo Habkost <ehabkost@redhat.com> wrote:
> Some typedefs and macros are defined after the type check macros.
> This makes it difficult to automatically replace their
> definitions with OBJECT_DECLARE_TYPE.
>
> Patch generated using:
>
>  $ ./scripts/codeconverter/converter.py -i --pattern=MoveSymbols \
>     $(git grep -l '' -- '*.[ch]')
>
> which will:
> - split "typdef struct { ... } TypedefName" declarations
> - move the typedefs and #defines above the type check macros
> - add missing #include "qom/object.h" lines if necessary
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Just curious, how did my name ended on the CC'd list?  I don't see any
file that I touched or that is migration related.

Later, Juan.


