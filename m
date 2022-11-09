Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oshzJ-0007WF-LF
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 05:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oshzI-0007UW-70
 for qemu-riscv@nongnu.org; Wed, 09 Nov 2022 05:07:16 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oshzG-00051o-4G
 for qemu-riscv@nongnu.org; Wed, 09 Nov 2022 05:07:15 -0500
Received: by mail-pj1-x1036.google.com with SMTP id o7so16276444pjj.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Nov 2022 02:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FIMZO+D7A7YWvP28DBfiNBcFj0mG8bwS1fhSBoS/zhg=;
 b=fQ0t0siP9+aidvKRsZ7dxaXslTvJPGN63XVHLHL0boQ+r3TTW2JuMl+xepI6QmhTQ9
 KuSkotzk+oSk6l3jGjciCvZDf86WgvYmtx4MngBeZ+mjavioMa+m94v7GLbmwHcl9e2E
 Dg4UDSggkuKfgMSBUw/y1iv6GeV1WUh0kzA3UhZsqt7dbJWx5IlYxlWBUi3ob1r9zgMx
 VBsjQdoKnFsbXbE18hq2U59KWzMym89EYubB2M+bsyYI4f+RceH58dqiSj/cri0PzQgf
 1xTE1KKzvtDEE12UKHm/uzH1TsN7x6y9Jc8vI2ribCZL6reVh44DMrwX4AO0zH9iTBud
 fYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIMZO+D7A7YWvP28DBfiNBcFj0mG8bwS1fhSBoS/zhg=;
 b=d0eDuV66hjAqHxOsuL0jE75E9iRLFmHIohVNwrVRbP39uE8qlDRy4GHV1jV5VtA/BS
 A68shiFEvxGYreFvtwRk9NJHX+zXEom/xhzVShIIAvkS3BRki3nTTSfaiUKoPLxnqwNd
 MjCJIUwPvpWJP9oiuyPcVrisW4wpUp6WC3Hrkdm4fhbZjDf1ijjz/v9KLEasd+40I/1r
 y26E37xznCaNoyUCuNYjog0hkzbMjGY2gzSceUSK/4/MlL0yN0w/1CVv007PYRyG1ITa
 L/rtG0nsCveaipytEM72mQ8+ykns9/xpNM3cifzTw8mpOThIIN8zlPRViSYdZuJeYGa1
 ENGQ==
X-Gm-Message-State: ACrzQf0OmoZ164np5HZsciH9BN3OfrQa2tYkOEhCgd5yOgep4q+R7a23
 WAfBvCkyQW/MvDB3E0K6vmdVrg==
X-Google-Smtp-Source: AMsMyM7qLxjeEE661Bm7sLgeFMzof+TiloRWu57UUoP2V4/mutbSh2YZIWSGKE8jpo6GlCkdO+KPfA==
X-Received: by 2002:a17:90a:5308:b0:20b:1eae:c94e with SMTP id
 x8-20020a17090a530800b0020b1eaec94emr44094539pjh.88.1667988432125; 
 Wed, 09 Nov 2022 02:07:12 -0800 (PST)
Received: from sunil-laptop ([49.206.12.236]) by smtp.gmail.com with ESMTPSA id
 s7-20020a17090b070700b002137030f652sm866819pjz.12.2022.11.09.02.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 02:07:11 -0800 (PST)
Date: Wed, 9 Nov 2022 15:37:04 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <Y2t7yBW8QDCrsg0k@sunil-laptop>
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop>
 <CAFEAcA-121P8gwOHRsbp4swP9ah1CZO8rVP75+WyvgF1pou8Aw@mail.gmail.com>
 <87tu395tbv.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tu395tbv.fsf@pond.sub.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 09 Nov 2022 10:07:16 -0000

Thanks a lot for the feedback and history. I understand now there are good
reasons to mandate fixed size flash. Will drop this patch.

Thanks
Sunil

