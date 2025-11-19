Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762C2CF58C8
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 18:09:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLmcm-0003Bo-DI; Wed, 19 Nov 2025 13:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmch-000393-Kt
 for qemu-riscv@nongnu.org; Wed, 19 Nov 2025 13:09:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmcg-0002wn-9x
 for qemu-riscv@nongnu.org; Wed, 19 Nov 2025 13:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763575781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iWKuGlFXZQJhDckFQcgt5gxApYJTrA/9Towipm9l4OQ=;
 b=CGTnwgeGwbbN0YgTb4hgrl1iLdaUylAA2r+WMIzXkxeF45EUOH2SaVoUvQQrLcOIqyjYSx
 7VUoRYnbi+5KCwG3nCy7Ad+vNzHYB8CKPIj3yGthBrMQic0xDPxD/QhielG/gd2BpCMwWT
 Wk9esbDAcyYg4OTtRyqs8GC7cw0mNlE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-mPcegozUMj66DdNgtNKCqw-1; Wed, 19 Nov 2025 13:09:38 -0500
X-MC-Unique: mPcegozUMj66DdNgtNKCqw-1
X-Mimecast-MFC-AGG-ID: mPcegozUMj66DdNgtNKCqw_1763575778
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88050708ac2so593226d6.2
 for <qemu-riscv@nongnu.org>; Wed, 19 Nov 2025 10:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763575778; x=1764180578;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iWKuGlFXZQJhDckFQcgt5gxApYJTrA/9Towipm9l4OQ=;
 b=eWMBRsYh3yTrcLxrSAOH2aufLNGm02pgVx881pblXqIA3+NM/Mwb11KZtNdMfKBGhz
 JaPIYIirN591pF3czUN/sIIsNrsajVdf2p40tfl490BQfDGsK40UrSquaXfgyTW1lUOn
 pGp7RYzNcHWSm2/qbe+U9TyCfvk99z6ASarRm2ZVR/Trrm2ZcNjXdbvYz6ITLdWPFuRH
 yzOzpjI40ceOK5pS9M+9G3gy/tR1mH08MKZs+N1DAIQBIKM8FLsywxTFdN6xkErQteNG
 9u4ipr5KOuMYzORe2yJje8pBe/fu130IXjQxOjRSfMFzhmX7aDEEfTV2M1ebR0Xo5GUD
 R60A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdEbc504qNig6D38eXfaAS24yyfTIwOYO8pT8pOz1kRGfNVpv4nUtjOnz9VgcXLWI/TUXdmK3JGM/7@nongnu.org
X-Gm-Message-State: AOJu0YxRZFAal5Rm1F/hn/mJ+0/ij6X9zkCoN9zyFVVpFeCFf6huTZvJ
 akQiZkYv4bU/Hg/ia8NbIS6y9Zpgl/ErH1UTNcUiKI1SXbVZjPxjHH/wZ+BO+/zBN+oOC3V1EjG
 qSE5LtMUjR1++4so+LlvXgfED5gEtSRjBrnrUe0FAjidKVbmNFw+60LQN
X-Gm-Gg: ASbGnct1ZBlPHVQFMFK88EjnSc6oK3Ay9Wn3v6J6QZ5ll+l2pSTsNZ0ce3SdTNXe4dG
 2PRr3muCJ+/GAUcZ3bV3WdEJg2dt8ufHcwKyB+dqI6XZI25ZyLKnkATwUf+tYsdRUlGA4zuynaW
 MN2u2rtLBcQQjI67f5gj9qfZrqBJ+XUpDqyYMDlfeg4Ts6bOt36t0kM/vlPP6KODca8mSwEnEmw
 vQ3mYfewwxq0HoT3rXDxr3sJZ5HfrHeWplhVxP6Be+O9it7Qzsmwi7bkosTZRLeH3+fFZLAkWrL
 OOMkKjyrAXTGA+BOSPDsriIlyqVrg6hYZFDslX+0Fk2cPRAx7t/+R7i8wAsRwjecAyEg7wjLyRz
 a/7s=
X-Received: by 2002:a05:6214:33c6:b0:87c:a4f:afd3 with SMTP id
 6a1803df08f44-8846e02d57bmr1889266d6.16.1763575778001; 
 Wed, 19 Nov 2025 10:09:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELSahBwRm5SxgULUmKqEQouDGBl9IAYstEeLqOk0A49a/xIWSs9mc1bJ81aMUBPzhLGlz0ig==
X-Received: by 2002:a05:6214:33c6:b0:87c:a4f:afd3 with SMTP id
 6a1803df08f44-8846e02d57bmr1888776d6.16.1763575777665; 
 Wed, 19 Nov 2025 10:09:37 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e445bd4sm265876d6.10.2025.11.19.10.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:09:37 -0800 (PST)
Date: Wed, 19 Nov 2025 13:09:35 -0500
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
 harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 berrange@redhat.com, farosas@suse.de, eblake@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/5] nbd/client-connection: Replace error_propagate() by
 assignment
Message-ID: <aR4H3-CQ-F8ZUN_Z@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-4-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yi0HF2in1v7MoWFc2ITIqkZ5Q90cm8LW0tjgGp92F10_1763575778
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Nov 19, 2025 at 02:08:53PM +0100, Markus Armbruster wrote:
> connect_thread_func() sets a variable to null, then error_propagate()s
> an Error * to it.  This is a roundabout way to assign the Error * to
> it, so replace it by just that.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


