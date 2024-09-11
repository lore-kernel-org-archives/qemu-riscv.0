Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26951EE49BD
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 14:54:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soOdZ-0006e7-Ai; Wed, 11 Sep 2024 10:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1soOb7-0005wx-SL
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 10:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1soOb4-0006Lz-W6
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 10:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726065915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A4cGYuzEcsU+H11W5DX5/hXv+/XV9V+6iflAKbWezCQ=;
 b=dyWzeGOlmPTpnVUUPEKjKVCtETJoJJnWmfQs3Khp3Hm4rXH8+5BCdymLxZ86qrH4r2FyAj
 RwUztOtwFsHcWAbrq9FDhrCBFVqZlSIfI+ceEttq/umYuZGbqDA1z6Yj9UcA9IcbINr37l
 4nNIvceVNO205VMeUrSue9C10C4mJUk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-Wdg0JXGSOma6NshdNy4m7w-1; Wed, 11 Sep 2024 09:40:52 -0400
X-MC-Unique: Wdg0JXGSOma6NshdNy4m7w-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4581efb73d3so90910471cf.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2024 06:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726062051; x=1726666851;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A4cGYuzEcsU+H11W5DX5/hXv+/XV9V+6iflAKbWezCQ=;
 b=txFuTq0wfEzkjmUjTGcGFgrO1YfdBpgzBl/i5MvGUeG9aFRNSyW5wGogiOiIwZCLWG
 RLx8B+Fi+R76yK7RExGWGVVglhGrBm9YXFhSeeCypcKfu2/L67OYbjHj1fWjFB+XujT2
 0Z/iMuOmA6omsQmcNgsHQa4cLFui9uQPaqqhC0DFz8Nk/HtDcc1p3K0frQyK8M4gO5qS
 Hvvl10pG1LTmJayqvf/q69hMITBTn+b8jX0CIL9JFpWpRruzCbcRjmBXTB67V6xFhX/R
 DxThbQGwActW+lKEEkQbo5hhQKO52EmeTztwJ7MEmXJngF3v5kirvkcgWQQ6duvvK5c6
 UrUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDu83yjuYRlF1RPONXrDgjHsVTtbI3nDcsS1rYv48fj0/lW4vSqfg4il0cEN08KIeOzFbdCtrVFhYZ@nongnu.org
X-Gm-Message-State: AOJu0YzhOWhXyhjRC4hHqosQ3c2GbbIJKfqF152Q03EYaMDRA0iTRTZQ
 Ak/MMKOfXznTYIRGGaEvNE/nFwZc7tFw8tlWIop207HPTa2sty2zZL/6nB4RfKhK+1mxthsVlGC
 x8ILA6mm7pkrq9OfOrJJu5l2RcyDlqmynA/1Xuq98PpxN6CKXV3cT
X-Received: by 2002:ac8:57c4:0:b0:458:59e3:2b52 with SMTP id
 d75a77b69052e-45859e332abmr16949791cf.55.1726062051262; 
 Wed, 11 Sep 2024 06:40:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9OJUDpC/dDLPTaAj7vE1LX91DjdMwKKxOTbejPT9DFiRR1lsGsySzd/YLuGZUG3kBLFK7Vw==
X-Received: by 2002:ac8:57c4:0:b0:458:59e3:2b52 with SMTP id
 d75a77b69052e-45859e332abmr16948861cf.55.1726062049492; 
 Wed, 11 Sep 2024 06:40:49 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45822e60974sm41358491cf.8.2024.09.11.06.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 06:40:48 -0700 (PDT)
Date: Wed, 11 Sep 2024 09:40:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 21/39] migration: replace assert(false) with
 g_assert_not_reached()
Message-ID: <ZuGd3bcawih4bN9Z@x1n>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-22-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240910221606.1817478-22-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Sep 10, 2024 at 03:15:48PM -0700, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


